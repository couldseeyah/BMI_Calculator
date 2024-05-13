import 'package:flutter/material.dart';

class BmiBrain extends StatelessWidget {
  final int age;
  final String gender;
  final int weight;
  final int height;

  final Map bmiGrowthChartBoundaries = {
    'female': [
      [14.4, 18.0, 19.2],
      [14.0, 17.2, 18.3],
      [13.7, 16.7, 18.1],
      [13.5, 16.8, 18.3],
      [13.4, 17.1, 18.7],
      [13.4, 17.6, 19.6],
      [13.5, 18.3, 20.6],
      [13.8, 19.1, 21.8],
      [14.0, 19.9, 23.0],
      [14.4, 20.8, 24.1],
      [14.8, 21.7, 25.3],
      [15.4, 22.5, 26.3],
      [15.8, 23.4, 27.3],
      [16.4, 24.0, 28.1],
      [16.8, 24.6, 28.8],
      [17.3, 25.3, 29.6],
      [17.5, 25.7, 30.4],
      [17.8, 26.2, 31.0]
    ],
    'male': [
      [14.7, 18.1, 19.3],
      [14.4, 17.4, 18.3],
      [14.0, 16.9, 17.8],
      [13.8, 16.8, 17.9],
      [13.7, 17.0, 18.4],
      [13.7, 17.4, 19.1],
      [13.8, 17.9, 20.0],
      [13.9, 18.6, 21.0],
      [14.2, 19.4, 22.1],
      [14.5, 20.1, 23.1],
      [15.0, 21.0, 24.2],
      [15.4, 21.8, 25.1],
      [15.9, 22.6, 26.0],
      [16.5, 23.4, 26.8],
      [17.1, 24.2, 27.5],
      [17.6, 24.9, 28.2],
      [18.3, 25.6, 28.9],
      [18.7, 26.3, 29.7]
    ]
  };

  BmiBrain(
      {required this.age,
      required this.gender,
      required this.weight,
      required this.height,
      super.key});

  double calculateBMI() {
    double bmi = weight / (height * height * 0.0001);
    return bmi;
  }

  String getBmiCategory(double bmi) {
    String bmiCategory;
    double boundary1;
    double boundary2;
    double boundary3;

    //for adults
    if (age >= 20) {
      boundary1 = 18.5;
      boundary2 = 25;
      boundary3 = 30;
    }
    //for children age 2-20
    else {
      boundary1 = bmiGrowthChartBoundaries[gender][age - 2][0];
      boundary2 = bmiGrowthChartBoundaries[gender][age - 2][1];
      boundary3 = bmiGrowthChartBoundaries[gender][age - 2][2];
    }
    bmiCategory = bmi < boundary1
        ? 'Underweight'
        : bmi < boundary2
            ? 'Normal'
            : bmi < boundary3
                ? 'Overweight'
                : 'Obese';
    return bmiCategory;
  }

  String bmiInfo(String bmiCategory) {
    String bmiInfo = (bmiCategory == 'Underweight')
        ? 'You have a low BMI, consider consulting with a healthcare professional to ensure you are meeting your nutritional needs and maintaining a healthy weight.'
        : (bmiCategory == 'Normal')
            ? 'You have a healthy BMI, continue to maintain a balanced diet and engage in regular physical activity to support overall well-being.'
            : (bmiCategory == 'Overweight')
                ? 'You are in the overweight range, focus on adopting a balanced diet and increasing physical activity to achieve a healthier weight.'
                : 'You are classified as obese, seek guidance from a healthcare professional to develop a personalized weight management plan incorporating dietary changes and exercise.';
    return bmiInfo;
  }
  
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
