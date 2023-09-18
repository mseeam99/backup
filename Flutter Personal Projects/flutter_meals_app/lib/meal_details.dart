import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import 'meal.dart';

class MealDetails extends StatefulWidget {
  const MealDetails({super.key, required this.meal});

  final Meal meal;

  @override
  State<MealDetails> createState() => _MealDetailsState();
}

class _MealDetailsState extends State<MealDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.meal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(widget.meal.imageUrl),
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Ingredients',
              style: TextStyle(
                color: Colors.amber,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            for (final ingredient in widget.meal.ingredients)
              Text(
                ingredient,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            const SizedBox(
              height: 20,
            ),
            Column(
              children: [
                const Text(
                  'Steps',
                  style: TextStyle(
                    color: Colors.amber,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                for (final step in widget.meal.steps)
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    child: Text(
                      step,
                      textAlign: TextAlign.left,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
