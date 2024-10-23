import 'package:mirror_app/common/models/common_model.dart';

import '../constants/pattern.dart';

class PatternDataStorage {
  static List<CommonModel> patternData = <CommonModel>[];

  static void setUpData() {
    patternData = (patternList as List)
        .map((data) => CommonModel.fromJson(data))
        .toList();
  }
}
