import 'package:flutter/material.dart';
import 'constants.dart';

class CalculateButton extends StatelessWidget {
  const CalculateButton({
    super.key,
    required this.label,
    required this.onTapFunction,
  });

  final String label;
  final VoidCallback onTapFunction;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapFunction,
      child: Container(
        color: kCalculateColour,
        margin: const EdgeInsets.only(top: 10.0),
        padding: const EdgeInsets.only(bottom: 3.0),
        width: double.infinity,
        height: 80.0,
        child: Center(
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0,
            ),
          ),
        ),
      ),
    );
  }
}
