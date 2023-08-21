import 'package:flutter/material.dart';
import 'bmi_calculator.dart';
import 'even_odd.dart';
import 'api_integration.dart';

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
          mainAxisAlignment: MainAxisAlignment.start,
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
            SizedBox(height: 5),
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
            SizedBox(height: 10),
            ElevatedButton(
                onPressed: () async {
                  final evenValue = await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EvenOddScreen()),
                  );
                  setState(() {
                    _count = evenValue;
                  });
                },
                child: Text('Even/Odd')),
            SizedBox(height: 10),
            ElevatedButton(
                onPressed: () async {
                  final apiIntegration = await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => APIIntegration()),
                  );
                  setState(() {
                    _count = apiIntegration;
                  });
                },
                child: Text('Api integration'))
          ],
        ),
      ),
    );
  }
}
