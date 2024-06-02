import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/categories.dart';
import 'package:meals_app/screens/meals_detail.dart';
import 'package:meals_app/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, required this.title, required this.meals});

  final String title;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    void backToHome() {
      Navigator.push(context,
          MaterialPageRoute(builder: (ctx) => const CategoriesScreen()));
    }

    void selectMeal(Meal meal) {
      Navigator.push(context,
          MaterialPageRoute(builder: (ctx) => MealsDetailScreen(meal: meal)));
    }

    Widget showMeals;
    showMeals = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (ctx, index) => MealItem(
              meal: meals[index],
              onSelectMeal: () {
                selectMeal(meals[index]);
              },
            ));
    if (meals.isEmpty) {
      showMeals = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Uhoh, nothing here!',
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Try selecting any other category',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            ElevatedButton(
                onPressed: () {
                  backToHome();
                },
                child: const Text('Back to Home'))
          ],
        ),
      );
    }
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: showMeals);
  }
}
