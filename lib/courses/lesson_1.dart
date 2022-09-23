import 'package:flutter/material.dart';

class Cours1 extends StatefulWidget {
  const Cours1({super.key});

  @override
  State<Cours1> createState() => _Cours1State();
}

class _Cours1State extends State<Cours1> {

  // ignore: non_constant_identifier_names
  final double EUR = 4.5;
  String erorrMsg = '', _amount = '', _result = '';

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text('Currency converter'))),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          // ignore: always_specify_types
          children: [
            Image.network(
                'https://www.capital.ro/wp-content/uploads/2022/06/bani-lei-1-1024x755.jpg',
              width: size.width,
              height: 400,
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter the amount in EUR',
                errorText: erorrMsg,
              ),
              onChanged: (String value) {
                _amount = value;
              },
            ),
            const SizedBox(height: 20,),
            RaisedButton(
                child: Text('Convert'.toUpperCase()),
                onPressed: () {
                  setState(() {

                    bool t = false;

                    try
                    {
                      final double temp = double.parse(_amount) * EUR;
                      _result = temp.toString();

                    } catch(ex) {
                      t = true;
                    }

                    if (t)
                    { erorrMsg = 'Enter only number'; _amount = ''; }
                    else
                    { erorrMsg = ''; }

                  });

                }
            ),

            const SizedBox(height: 20,),

            Text(
              _result,
              style: const TextStyle(fontSize: 25),
            )
          ],
        ),
      ),
    );
  }
}
