import 'package:flutter/material.dart';
import 'package:mealzz/models/meal.dart';
import 'package:mealzz/widgets/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.meal,required this.onSelectMeal});

  final Meal meal;
  final void Function(Meal meal) onSelectMeal;
  String get complexityText{
    return meal.complexity.name[0].toUpperCase()+meal.complexity.name.substring(1);
  }

  String get affordabilityText{
    return meal.affordability.name[0].toUpperCase()+meal.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      //stack ignores the shape
      clipBehavior: Clip.hardEdge,
      //to hardshape the stack widget content since shape doesnot work properly with stack
      elevation: 2,
      //give 3d effect elevation
      child: InkWell(
        onTap: () {onSelectMeal(meal);},
        child: Stack(
          //position multiple widgets on top of each other
          children: [
            Hero(tag: meal.id,
              child: FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(meal.imageUrl),
                fit: BoxFit.cover,
                height: 200,
                width: double.infinity,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 6, horizontal: 44),
                color: Colors.black54,
                child: Column(
                  children: [
                    Text(
                      meal.title,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      //very long text
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MealItemTrait(
                            icon: Icons.schedule,
                            label: '${meal.duration} mins'),
                        SizedBox(width: 12,),
                        MealItemTrait(icon: Icons.work, label: '$complexityText'),
                        SizedBox(width: 12,),
                        MealItemTrait(icon: Icons.attach_money, label: '$affordabilityText')
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
