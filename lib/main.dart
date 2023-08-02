import 'package:flutter/material.dart';
import 'bmi_calculator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter BMI Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _count = 0;

  void _incrementCounter() {
    setState(() {
      _count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Caculator app'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Counter:',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              '$_count',
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              onPressed:
                  _incrementCounter, // Call the _incrementCounter function
              child: Text('Increment'),
            ),
            SizedBox(height: 16),
            // ElevatedButton(
            //   onPressed: () {
            //     // Navigate to BMI Calculator screen
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(builder: (context) => BMICalculator()),
            //     );
            //   },
            //   child: Text('BMI Calculator'),
            // ),
            ElevatedButton(
              onPressed: () async {
                // Navigate to BMI Calculator screen and wait for the result (reset value)
                final resetValue = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BMICalculator()),
                );

                // Update the counter with the reset value
                setState(() {
                  _count = resetValue;
                });
              },
              child: Text('BMI Calculator'),
            ),
          ],
        ),
      ),
    );
  }
}
