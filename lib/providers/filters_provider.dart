import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Filter
{
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

class FiltersNotifier extends StateNotifier<Map<Filter,bool>>{
  FiltersNotifier():super({
    Filter.glutenFree:false,
    Filter.lactoseFree:false,
    Filter.vegetarian:false,
    Filter.vegan:false,
  });

  void setFilters(Map<Filter,bool> chosenFilters)
  {
    state=chosenFilters;
  }
  void setFilter(Filter filter,bool isActive)
  //state[filter]=isActive;//not allowed!=> mutating state
  {
    state={
      ...state,filter:isActive, //copy existing map key value pair
    };
  }
}

final filterProvider = StateNotifierProvider<FiltersNotifier,Map<Filter,bool>>((ref) => FiltersNotifier());