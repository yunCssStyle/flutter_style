import 'package:mirror_app/common/models/common_model.dart';

class DetailDataStorage {
  static List<CommonModel> detailData = <CommonModel>[];

  static List<CommonModel> getData(int type) {
    detailData.clear();
    if (type == 1 || type == 3 || type == 4) {
      detailData.add(CommonModel(
          id: 1, name: 'HOOD', listOrder: 0, children: [], renderName: '후드'));
      detailData.add(CommonModel(
          id: 2, name: 'COLLAR', listOrder: 0, children: [], renderName: '카라'));
      detailData.add(CommonModel(
          id: 3,
          name: 'HIGHNECK',
          listOrder: 0,
          children: [],
          renderName: '하이넥'));
      detailData.add(CommonModel(
          id: 4,
          name: 'ETC',
          listOrder: 0,
          children: [],
          renderName: '라운드 넥 및 기타'));
    }
    return detailData;
  }
}
