import 'package:mirror_app/common/models/common_model.dart';

import '../constants/ai_category.dart';

class CategoryDataStorage {
  static List<CommonModel> categoryDataF = <CommonModel>[];
  static List<CommonModel> categoryDataM = <CommonModel>[];

  static void setUpData() {
    categoryDataF = (aiCategoryF as List)
        .map((data) => CommonModel.fromJson(data))
        .toList();
    categoryDataM = (aiCategoryM as List)
        .map((data) => CommonModel.fromJson(data))
        .toList();
  }
}
