import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealzz/data/dummy.dart';

final mealsProvider= Provider((ref) {
  return dummyMeals;
},); //create a provider object