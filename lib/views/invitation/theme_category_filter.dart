import 'package:flutter/material.dart';

class ThemeCategoryFilter extends StatefulWidget {
  final List<String> categories;
  final void Function(String) onCategoryChanged;
  const ThemeCategoryFilter({super.key, required this.categories, required this.onCategoryChanged});

  @override
  State<ThemeCategoryFilter> createState() => _ThemeCategoryFilterState();
}

class _ThemeCategoryFilterState extends State<ThemeCategoryFilter> {
  String selectedCategory = "All";
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
