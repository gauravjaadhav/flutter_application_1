import 'package:flutter/material.dart';

class BMICalculator extends StatefulWidget {
  @override
  _BMICalculatorState createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  double bmi = 0;

  String? weightError;
  String? heightError;

  void calculateBMI() {
    setState(() {
      weightError = null;
      heightError = null;

      double weight = double.tryParse(weightController.text) ?? 0;
      double height = double.tryParse(heightController.text) ?? 0;

      if (weight <= 0 || weight > 500) {
        weightError = "Please enter a valid weight in kgs";
      }

      if (height <= 0 || height > 3) {
        heightError = "Please enter a valid height in meters";
      }

      if (weight > 0 && height > 0 && weightError == null && heightError == null) {
        bmi = weight / (height * height);
      }
    });
  }

  void clearWeightError() {
    setState(() {
      weightError = null;
    });
  }

  void clearHeightError() {
    setState(() {
      heightError = null;
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
            Navigator.pop(context, 0); // Pop the screen and pass the reset value (0) to MyHomePage
          },
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: weightController,
                keyboardType: TextInputType.number,
                onChanged: (value) => clearWeightError(), // Clear weight error when the user starts typing
                decoration: InputDecoration(
                  labelText: 'Enter your weight (kg)',
                  errorText: weightError,
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: heightController,
                keyboardType: TextInputType.number,
                onChanged: (value) => clearHeightError(), // Clear height error when the user starts typing
                decoration: InputDecoration(
                  labelText: 'Enter your height (m)',
                  errorText: heightError,
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: calculateBMI,
                child: Text('Calculate BMI'),
              ),
              SizedBox(height: 16),
              Text(
                bmi == 0 ? 'Your BMI will appear here' : 'Your BMI: ${bmi.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 24),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
