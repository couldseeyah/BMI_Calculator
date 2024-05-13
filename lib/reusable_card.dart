import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color colour;
  final Widget childWidget;
  final Function onTapFunction;

  const ReusableCard(
      {required this.colour, super.key, required this.childWidget, required this.onTapFunction});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          onTapFunction();
        },
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: colour,
          ),
          child: childWidget,
        ),
      ),
    );
  }
}
