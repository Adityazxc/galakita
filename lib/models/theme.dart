class ThemeModel {
  final int id;
  final String name;
  final String thumbnail;
  final CategoryModel category;

  ThemeModel({
    required this.id,
    required this.name,
    required this.thumbnail,
    required this.category,
  });

  factory ThemeModel.fromJson(Map<String, dynamic> json) {
    return ThemeModel(
      id: json['id'],
      name: json['name'],
      thumbnail: json['thumbnail'],
      category: CategoryModel.fromJson(json['category']),
    );
  }
}

class CategoryModel {
  final int id;
  final String name;

  CategoryModel({
    required this.id,
    required this.name,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      name: json['name'],
    );
  }
}
