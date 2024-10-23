import 'package:mirror_app/common/models/common_model.dart';

import '../constants/color.dart';

class ColorDataStorage {
  static List<CommonModel> colorData = <CommonModel>[];

  static void setUpData() {
    colorData =
        (colorList as List).map((data) => CommonModel.fromJson(data)).toList();
  }
}
