import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealzz/models/meal.dart';

class FavoriteMealsNotifier extends StateNotifier<List<Meal>>
{
  FavoriteMealsNotifier(): super([]);

  bool toggleMealFavoriteStatus(Meal meal) //not allowed to change so we replace the list
  {
    final mealIsFavorite=state.contains(meal);  //storing is possible
    if(mealIsFavorite)
      {
        state.where((m)=>m.id!=meal.id).toList();
        return false;
      }
    else {
      state = [...state,meal]; //spread operator: use to pull out all element in the list and add them in the new list
      return true;

    }
  }
}

final favoriteMealsProvider=StateNotifierProvider<FavoriteMealsNotifier,List<Meal>>((ref){
  return FavoriteMealsNotifier();
}); // use statenotifierprovider when data is dynamic can change instead of provider