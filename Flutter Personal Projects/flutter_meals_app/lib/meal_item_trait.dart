import 'package:flutter/material.dart';

class MealItemTrait extends StatefulWidget {
  const MealItemTrait({super.key, required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  State<MealItemTrait> createState() => _MealItemTraitState();
}

class _MealItemTraitState extends State<MealItemTrait> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          widget.icon,
          size: 17,
          color: Colors.white,
        ),
        const SizedBox(
          width: 6,
        ),
        Text(
          widget.label,
          style: const TextStyle(
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
