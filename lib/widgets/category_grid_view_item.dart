import 'package:flutter/material.dart';
import 'package:meals_app/models/category.dart';

class CategoryGridViewItem extends StatelessWidget {
  const CategoryGridViewItem({super.key, required this.category});

  final Category category;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          category.color.withOpacity(0.3),
          category.color.withOpacity(0.9)
        ], begin: Alignment.center, end: Alignment.topRight),
      ),
      child: Text(category.title,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Theme.of(context).colorScheme.onBackground)),
    );
  }
}