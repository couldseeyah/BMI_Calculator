import 'package:flutter/material.dart';
import 'constants.dart';

class CardContent extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color iconColor;

  const CardContent({required this.icon, required this.label, required this.iconColor,super.key});

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Icon(
        icon,
        size: 80.0,
        color: iconColor,
      ),
      const SizedBox(
        height: 15.0,
      ),
      Text(
        label,
        style: kTextStyle,
      ),
    ]);
  }
}
