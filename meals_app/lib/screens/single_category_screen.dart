import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

import '../widgets/meal_item.dart';
import '../models/meal.dart';

class SingleCategoryScreen extends StatefulWidget {
  // const ({ Key? key }) : super(key: key);
  // final String categoryId;
  // final String catergoryTitle;

  final List<Meal> availableMeals;

  SingleCategoryScreen(this.availableMeals);

  @override
  State<SingleCategoryScreen> createState() => _SingleCategoryScreenState();
}

class _SingleCategoryScreenState extends State<SingleCategoryScreen> {
  String catergoryTitle;
  List<Meal> categoryMeals;
  var _loadedInitData = false;

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;

      final catergoryId = routeArgs['id'];
      catergoryTitle = routeArgs['title'];
      categoryMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(catergoryId);
      }).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(catergoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
              id: categoryMeals[index].id,
              title: categoryMeals[index].title,
              imageUrl: categoryMeals[index].imageUrl,
              duration: categoryMeals[index].duration,
              affordability: categoryMeals[index].affordability,
              complexity: categoryMeals[index].complexity);
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
