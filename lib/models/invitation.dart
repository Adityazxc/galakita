class InvitationModel {
  final int id;
  final String title;
  final String url;
  final String themeId;

  InvitationModel({
    required this.id,
    required this.title,
    required this.url,
    required this.themeId,
  });

  Map<String, dynamic> toMap() {
    return {
      Constant.id: id,
      Constant.title: title,
      Constant.url: url,
      Constant.theme_id: themeId
    };
  }
}

class Constant {
  static const id = 'id';
  static const title = 'title';
  static const url = 'url';
  static const theme_id = 'theme_id';
}
