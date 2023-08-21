import 'package:flutter/material.dart';

// class EvenOddScreen extends StatefulWidget {
//   @override
//   _EvenOddScreenState createState() => _EvenOddScreenState();
// }
class EvenOddScreen extends StatefulWidget {
  @override
  _EvenOddScreenState createState() => _EvenOddScreenState();
}

class _EvenOddScreenState extends State<EvenOddScreen> {
  int number = 0;
  String result = '';

  void checkEvenOdd() {
    setState(() {
      if (number % 2 == 0) {
        result = 'Even';
      } else {
        result = 'Odd';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI Calculator'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context,
                  0); // Pop the screen and pass the reset value (0) to MyHomePage
            },
          ),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      if (value.isEmpty) {
                        result = '';
                      } else {
                        number = int.parse(value);
                      }
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'Enter a number',
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: checkEvenOdd,
                  child: Text('Check'),
                ),
                SizedBox(height: 20),
                Text(
                  'Result: $result',
                  style: TextStyle(fontSize: 24),
                ),
              ],
            ),
          ),
        ));
  }
}
