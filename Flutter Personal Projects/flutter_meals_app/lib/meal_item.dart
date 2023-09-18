import 'package:flutter/material.dart';
import 'package:flutter_meals_app/meal.dart';
import 'package:transparent_image/transparent_image.dart';

import 'meal_item_trait.dart';

class MealItem extends StatefulWidget {
  const MealItem({super.key, required this.meal, required this.onSelectMeal});

  final Meal meal;
  final void Function(BuildContext context, Meal meal) onSelectMeal;

  String get complexityText {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
  }

  String get affordabilityText {
    return meal.affordability.name[0].toUpperCase() +
        meal.affordability.name.substring(1);
  }

  @override
  State<MealItem> createState() => _MealItemState();
}

class _MealItemState extends State<MealItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      child: InkWell(
        onTap: () {
          widget.onSelectMeal(context, widget.meal);
        },
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(widget.meal.imageUrl),
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black54,
                padding:
                    const EdgeInsets.symmetric(vertical: 6, horizontal: 44),
                child: Column(
                  children: [
                    Text(
                      widget.meal.title,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MealItemTrait(
                          icon: Icons.schedule,
                          label: '${widget.meal.duration}min',
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        MealItemTrait(
                          icon: Icons.work,
                          label: widget.complexityText,
                        ),
                        MealItemTrait(
                          icon: Icons.attach_money,
                          label: widget.affordabilityText,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
