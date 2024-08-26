import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/models/category_model.dart';
import 'package:news_app_ui_setup/widgets/category_card.dart';

class CategoriesListView extends StatelessWidget {
  final List<CategoryModel> categories = const [
    CategoryModel(
      image: 'assets/entertaiment.avif',
      categoryName: 'entertainment',
    ),
    CategoryModel(
      image: 'assets/health.avif',
      categoryName: 'health',
    ),
    CategoryModel(
      image: 'assets/science.avif',
      categoryName: 'science',
    ),
    CategoryModel(
      image: 'assets/technology.jpeg',
      categoryName: 'technology',
    ),
    CategoryModel(
      image: 'assets/sports.avif',
      categoryName: 'sports',
    ),
    CategoryModel(
      image: 'assets/general.avif',
      categoryName: 'general',
    ),
  ];
  const CategoriesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return CategoryCard(category: categories[index]);
          }),
    );
  }
}
