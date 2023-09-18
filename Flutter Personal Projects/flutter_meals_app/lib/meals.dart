import 'package:flutter/material.dart';
import 'package:flutter_meals_app/meal.dart';
import 'package:flutter_meals_app/meal_details.dart';

import 'meal_item.dart';

class MealsScreen extends StatefulWidget {
  const MealsScreen({super.key, required this.title, required this.meals});

  final String title;
  final List<Meal> meals;

  void selectMeal(BuildContext context, Meal meal) {
    Navigator.pop(context);
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealDetails(meal: meal),
      ),
    );
  }

  @override
  State<MealsScreen> createState() => _MealsScreenState();
}

class _MealsScreenState extends State<MealsScreen> {
  @override
  Widget build(BuildContext context) {
    Widget? bodyWidget;

    if (widget.meals.isEmpty) {
      bodyWidget = const Center(
        child: Text(
          "Uh oh... Nothing here !",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      );
    }

    if (widget.meals.isNotEmpty) {
      bodyWidget = ListView.builder(
        itemCount: widget.meals.length,
        itemBuilder: (ctx, index) => MealItem(
          meal: widget.meals[index],
          onSelectMeal: widget.selectMeal,
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
        ),
      ),
      body: bodyWidget,
    );
  }
}
