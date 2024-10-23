class UserDressCategory {
  int? categoryDepth;
  int? categoryId;
  int? id;

  UserDressCategory({this.categoryDepth, this.categoryId, this.id});

  UserDressCategory.fromJson(Map<String, dynamic> json) {
    categoryDepth = json['categoryDepth'];
    categoryId = json['categoryId'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['categoryDepth'] = categoryDepth;
    data['categoryId'] = categoryId;
    data['id'] = id;
    return data;
  }
}
