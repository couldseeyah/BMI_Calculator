import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'calculate_button.dart';

enum Gender { male, female }

class Result extends StatelessWidget {
  final String bmiCategory;
  final double bmi;
  final String bmiInfo;

  const Result({required this.bmiCategory, required this.bmi, required this.bmiInfo, super.key});

  @override

  Widget build(BuildContext context) {

    Color resultColour = bmiCategory == 'Underweight' ? const Color.fromARGB(255, 0, 115, 208) : bmiCategory == 'Normal' ? const Color(0xFF24D876) : 
    bmiCategory == 'Overweight' ? Color.fromARGB(255, 227, 112, 5) : const Color.fromARGB(255, 206, 23, 10);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
        centerTitle: true, // Center title
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            height: 35.0,
          ),
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
            alignment: Alignment.bottomLeft,
            child: const Text(
              'Your Result',
              style: TextStyle(
                fontSize: 50.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ReusableCard(
            colour: kActiveCardColour,
            onTapFunction: () {},
            childWidget: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  bmiCategory,
                  style: kResultTextStyle.copyWith(
                    color: resultColour,
                  ),
                ),
                Text(
                  bmi.toStringAsFixed(1),
                  style: kNumberStyle.copyWith(fontSize: 85.0),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Text(
                    bmiInfo,
                    style: kTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 35.0,
          ),
          CalculateButton(
            label: 'RE-CALCULATE',
            onTapFunction: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
