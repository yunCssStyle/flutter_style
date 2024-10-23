import 'package:mirror_app/common/models/common_model.dart';

class SleevesDataStorage {
  static List<CommonModel> sleevesData = <CommonModel>[];

  static List<CommonModel> getData(int type, String gender) {
    sleevesData.clear();
    if (gender == 'F') {
      // 여자일때
      if (type == 1) {
        // 아우터
        sleevesData.add(CommonModel(
            id: 1,
            name: 'CAP',
            listOrder: 0,
            children: [],
            renderName: '짧은 반팔'));
        sleevesData.add(CommonModel(
            id: 2, name: 'HALF', listOrder: 0, children: [], renderName: '반팔'));
        sleevesData.add(CommonModel(
            id: 3,
            name: 'ELBOW',
            listOrder: 0,
            children: [],
            renderName: '팔꿈치'));
        sleevesData.add(CommonModel(
            id: 4,
            name: 'THREEQUATER',
            listOrder: 0,
            children: [],
            renderName: '7부'));
        sleevesData.add(CommonModel(
            id: 5, name: 'LONG', listOrder: 0, children: [], renderName: '손등'));
      } else if (type == 3) {
        // 탑
        sleevesData.add(CommonModel(
            id: 1,
            name: 'SLING',
            listOrder: 0,
            children: [],
            renderName: '어깨 끈'));
        sleevesData.add(CommonModel(
            id: 2,
            name: 'VEST',
            listOrder: 0,
            children: [],
            renderName: '민소매'));
        sleevesData.add(CommonModel(
            id: 3,
            name: 'CAP',
            listOrder: 0,
            children: [],
            renderName: '짧은 반팔'));
        sleevesData.add(CommonModel(
            id: 4, name: 'HALF', listOrder: 0, children: [], renderName: '반팔'));
        sleevesData.add(CommonModel(
            id: 5,
            name: 'ELBOW',
            listOrder: 0,
            children: [],
            renderName: '팔꿈치'));
        sleevesData.add(CommonModel(
            id: 6,
            name: 'THREEQUATER',
            listOrder: 0,
            children: [],
            renderName: '7부'));
        sleevesData.add(CommonModel(
            id: 7,
            name: 'WRIST',
            listOrder: 0,
            children: [],
            renderName: '손목'));
      } else if (type == 4) {
        // 드레스
        sleevesData.add(CommonModel(
            id: 1,
            name: 'SLING',
            listOrder: 0,
            children: [],
            renderName: '어깨 끈'));
        sleevesData.add(CommonModel(
            id: 2,
            name: 'VEST',
            listOrder: 0,
            children: [],
            renderName: '민소매'));
        sleevesData.add(CommonModel(
            id: 3,
            name: 'CAP',
            listOrder: 0,
            children: [],
            renderName: '짧은 반팔'));
        sleevesData.add(CommonModel(
            id: 4, name: 'HALF', listOrder: 0, children: [], renderName: '반팔'));
        sleevesData.add(CommonModel(
            id: 5,
            name: 'ELBOW',
            listOrder: 0,
            children: [],
            renderName: '팔꿈치'));
        sleevesData.add(CommonModel(
            id: 6,
            name: 'THREEQUATER',
            listOrder: 0,
            children: [],
            renderName: '7부'));
        sleevesData.add(CommonModel(
            id: 7,
            name: 'WRIST',
            listOrder: 0,
            children: [],
            renderName: '손목'));
      }
    } else if (gender == 'M') {
      // 남자일때
      if (type == 1) {
        // 아우터
        sleevesData.add(CommonModel(
            id: 1,
            name: 'CAP',
            listOrder: 0,
            children: [],
            renderName: '짧은 반팔'));
        sleevesData.add(CommonModel(
            id: 2, name: 'HALF', listOrder: 0, children: [], renderName: '반팔'));
        sleevesData.add(CommonModel(
            id: 3,
            name: 'ELBOW',
            listOrder: 0,
            children: [],
            renderName: '팔꿈치'));
        sleevesData.add(CommonModel(
            id: 4,
            name: 'THREEQUATER',
            listOrder: 0,
            children: [],
            renderName: '7부'));
        sleevesData.add(CommonModel(
            id: 5, name: 'LONG', listOrder: 0, children: [], renderName: '손등'));
      } else if (type == 3) {
        // 탑
        sleevesData.add(CommonModel(
            id: 1,
            name: 'VEST',
            listOrder: 0,
            children: [],
            renderName: '민소매'));
        sleevesData.add(CommonModel(
            id: 2,
            name: 'CAP',
            listOrder: 0,
            children: [],
            renderName: '짧은 반팔'));
        sleevesData.add(CommonModel(
            id: 3, name: 'HALF', listOrder: 0, children: [], renderName: '반팔'));
        sleevesData.add(CommonModel(
            id: 4,
            name: 'ELBOW',
            listOrder: 0,
            children: [],
            renderName: '팔꿈치'));
        sleevesData.add(CommonModel(
            id: 5,
            name: 'THREEQUATER',
            listOrder: 0,
            children: [],
            renderName: '7부'));
        sleevesData.add(CommonModel(
            id: 6,
            name: 'WRIST',
            listOrder: 0,
            children: [],
            renderName: '손목'));
      }
    }

    return sleevesData;
  }
}
