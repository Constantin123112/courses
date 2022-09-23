import 'dart:math';

import 'package:flutter/material.dart';

class Lesson2 extends StatefulWidget {
  const Lesson2({super.key});

  @override
  State<Lesson2> createState() => _Lesson2State();
}

class _Lesson2State extends State<Lesson2> {

  final TextEditingController fieldText = TextEditingController();

  int randomNumber = Random().nextInt(100);
  bool isEnableTextField = true;
  String enteredNumber = '';
  String msgEnteredNumber = '';
  String yourCurrentResult = '';
  String btnTxt = 'Guess';

  void pressToButton() {
    if (btnTxt == 'Guess')
    {
      try {
        if (int.parse(enteredNumber) == randomNumber) {
          yourCurrentResult = 'You guessed right.';

          showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: const Text('You guessed right'),
              content: Text('It was $enteredNumber'),
              actions: <Widget>[
                TextButton(
                  // ignore: always_specify_types
                  onPressed: () => {Navigator.pop(context, 'Cancel'), pressedShowDialogTryAgain()},
                  child: const Text('Try again!'),
                ),
                TextButton(
                  // ignore: always_specify_types
                  onPressed: () => { Navigator.pop(context, 'OK'), pressedShowDialogOk()},
                  child: const Text('OK'),
                ),
              ],
            ),
          );
        }
        else if (int.parse(enteredNumber) > randomNumber) {
          yourCurrentResult = 'Try lower';
        }
        else if (int.parse(enteredNumber) < randomNumber) {
          yourCurrentResult = 'Try higher';
        }
      } on Exception {
        yourCurrentResult = 'Enter number please!';
      }

      setState(() {
        msgEnteredNumber = 'You tried $enteredNumber';
      });
    }
    else {
      pressedShowDialogTryAgain();
    }

  }
  void pressedShowDialogOk() {
    setState(() {
      btnTxt = 'Reset';
      isEnableTextField = false;
      fieldText.clear();
    });
  }

  void pressedShowDialogTryAgain() {
    setState(() {
      randomNumber = Random().nextInt(100);
      yourCurrentResult = '';
      msgEnteredNumber = '';
      btnTxt = 'Guess';
      isEnableTextField = true;
      fieldText.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(title: const Center(child: Text('Guess mu number')),),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        color: const Color.fromRGBO(250,249,250,1),
        child: Column(
          children: <Widget>[
            const Text(
              'I`m thinking of a number between',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
            ),
            const Text('1 and 100.', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),),
            const SizedBox(height: 20),
            const Text(
                'It`s your turn to guess my number!',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 50),

            Text(
              msgEnteredNumber,
              style: const TextStyle(fontSize: 30, color: Colors.grey, fontWeight: FontWeight.bold),
            ),
            Text(
              yourCurrentResult,
              style: const TextStyle(fontSize: 30, color: Colors.grey, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 50),
            Container(
              width: size.width,
              height: 200,
              decoration: const BoxDecoration(
                // ignore: always_specify_types
                boxShadow: [
                  BoxShadow(
                    offset: Offset(5, 5),
                    blurRadius: 10,
                    color: Colors.grey
                  ),
                ],
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  // ignore: always_specify_types
                  children: [
                     const Text(
                      'Try a number!',
                      style: TextStyle(fontSize: 26, fontWeight: FontWeight.w500, color: Colors.grey),
                    ),
                    TextField(
                      enabled: isEnableTextField,
                      onChanged: (String value) {
                          enteredNumber = value;
                      },
                      controller: fieldText,
                    ),
                    RaisedButton(
                        onPressed: pressToButton,
                        child: Text(btnTxt),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
