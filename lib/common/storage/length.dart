import 'package:mirror_app/common/models/common_model.dart';
import 'package:mirror_app/pages/preview/model/preview_model.dart';

class LengthDataStorage {
  static List<CommonModel> lengthData = <CommonModel>[];

  static List<CommonModel> getData(PreviewModel inputModel) {
    int cate1 = inputModel.cate1;
    int cate2 = inputModel.cate2;
    int cate3 = inputModel.cate3;
    String gender = inputModel.gender;
    lengthData.clear();
    if (gender == 'F') {
      if (cate1 == 1 && cate2 == 8) {
        // 코트
        lengthData.add(CommonModel(
            id: 1,
            name: 'WAIST',
            listOrder: 0,
            children: [],
            renderName: '허리'));
        lengthData.add(CommonModel(
            id: 2,
            name: 'MIDDLE-HIP',
            listOrder: 0,
            children: [],
            renderName: '골반'));
        lengthData.add(CommonModel(
            id: 3,
            name: 'HIP',
            listOrder: 0,
            children: [],
            renderName: '힙 아래'));
        lengthData.add(CommonModel(
            id: 4,
            name: 'THIGH',
            listOrder: 0,
            children: [],
            renderName: '허벅지'));
        lengthData.add(CommonModel(
            id: 5,
            name: 'KNEE1',
            listOrder: 0,
            children: [],
            renderName: '무릎 위'));
        lengthData.add(CommonModel(
            id: 6,
            name: 'KNEE2',
            listOrder: 0,
            children: [],
            renderName: '무릎 아래'));
        lengthData.add(CommonModel(
            id: 7,
            name: 'MID1',
            listOrder: 0,
            children: [],
            renderName: '종아리'));
        lengthData.add(CommonModel(
            id: 8,
            name: 'MID2',
            listOrder: 0,
            children: [],
            renderName: '종아리 아래'));
        lengthData.add(CommonModel(
            id: 9,
            name: 'LONG',
            listOrder: 0,
            children: [],
            renderName: '발목 위'));
      } else if (cate1 == 1 && cate2 == 10) {
        // 점퍼
        lengthData.add(CommonModel(
            id: 1,
            name: 'WAIST',
            listOrder: 0,
            children: [],
            renderName: '허리'));
        lengthData.add(CommonModel(
            id: 2,
            name: 'MIDDLE-HIP',
            listOrder: 0,
            children: [],
            renderName: '골반'));
        lengthData.add(CommonModel(
            id: 3,
            name: 'HIPBONE',
            listOrder: 0,
            children: [],
            renderName: '중힙'));
        lengthData.add(CommonModel(
            id: 4,
            name: 'HIP',
            listOrder: 0,
            children: [],
            renderName: '힙 아래'));
        lengthData.add(CommonModel(
            id: 5,
            name: 'THIGH1',
            listOrder: 0,
            children: [],
            renderName: '허벅지 중간'));
        lengthData.add(CommonModel(
            id: 6,
            name: 'THIGH2',
            listOrder: 0,
            children: [],
            renderName: '허벅지 아래'));
        lengthData.add(CommonModel(
            id: 7,
            name: 'KNEE',
            listOrder: 0,
            children: [],
            renderName: '무릎 위'));
        lengthData.add(CommonModel(
            id: 8,
            name: 'MID',
            listOrder: 0,
            children: [],
            renderName: '종아리 위'));
        lengthData.add(CommonModel(
            id: 9,
            name: 'LONG',
            listOrder: 0,
            children: [],
            renderName: '발목 위'));
      } else if (cate1 == 1 && cate2 == 11) {
        // 베스트
        lengthData.add(CommonModel(
            id: 1,
            name: 'MIDRIFF',
            listOrder: 0,
            children: [],
            renderName: '가슴아래'));
        lengthData.add(CommonModel(
            id: 2,
            name: 'MIDDLE-HIP',
            listOrder: 0,
            children: [],
            renderName: '골반'));
        lengthData.add(CommonModel(
            id: 3,
            name: 'HIP',
            listOrder: 0,
            children: [],
            renderName: '힙 아래'));
        lengthData.add(CommonModel(
            id: 4,
            name: 'THIGH',
            listOrder: 0,
            children: [],
            renderName: '허벅지'));
        lengthData.add(CommonModel(
            id: 5, name: 'KNEE', listOrder: 0, children: [], renderName: '무릎'));
        lengthData.add(CommonModel(
            id: 6,
            name: 'MID',
            listOrder: 0,
            children: [],
            renderName: '종아리 위'));
      } else if (cate1 == 1 && cate2 == 12) {
        // 가디건
        lengthData.add(CommonModel(
            id: 1,
            name: 'MICRO',
            listOrder: 0,
            children: [],
            renderName: '가슴 위'));
        lengthData.add(CommonModel(
            id: 2,
            name: 'MIDRIFF',
            listOrder: 0,
            children: [],
            renderName: '가슴 아래'));
        lengthData.add(CommonModel(
            id: 3,
            name: 'WAIST',
            listOrder: 0,
            children: [],
            renderName: '허리'));
        lengthData.add(CommonModel(
            id: 4,
            name: 'HIP',
            listOrder: 0,
            children: [],
            renderName: '힙 아래'));
        lengthData.add(CommonModel(
            id: 5,
            name: 'THIGH1',
            listOrder: 0,
            children: [],
            renderName: '허벅지 중간'));
        lengthData.add(CommonModel(
            id: 6,
            name: 'THIGH2',
            listOrder: 0,
            children: [],
            renderName: '허벅지 아래'));
        lengthData.add(CommonModel(
            id: 7,
            name: 'KNEE',
            listOrder: 0,
            children: [],
            renderName: '무릎 위'));
        lengthData.add(CommonModel(
            id: 8,
            name: 'MID',
            listOrder: 0,
            children: [],
            renderName: '종아리 위'));
      } else if (cate1 == 2 && cate2 == 13) {
        // 바지
        lengthData.add(CommonModel(
            id: 1,
            name: 'MICRO',
            listOrder: 0,
            children: [],
            renderName: '가장 짧은 기장'));
        lengthData.add(CommonModel(
            id: 2,
            name: 'SHORT1',
            listOrder: 0,
            children: [],
            renderName: '허벅지 중간 위'));
        lengthData.add(CommonModel(
            id: 3,
            name: 'SHORT2',
            listOrder: 0,
            children: [],
            renderName: '허벅지 중간'));
        lengthData.add(CommonModel(
            id: 4,
            name: 'BERMUDA1',
            listOrder: 0,
            children: [],
            renderName: '허벅지 아래'));
        lengthData.add(CommonModel(
            id: 5,
            name: 'BERMUDA2',
            listOrder: 0,
            children: [],
            renderName: '무릎 위'));
        lengthData.add(CommonModel(
            id: 6,
            name: 'KNEE',
            listOrder: 0,
            children: [],
            renderName: '무릎 아래'));
        lengthData.add(CommonModel(
            id: 7, name: 'MID', listOrder: 0, children: [], renderName: '종아리'));
        lengthData.add(CommonModel(
            id: 8,
            name: 'CAPRI',
            listOrder: 0,
            children: [],
            renderName: '8부 기장'));
        lengthData.add(CommonModel(
            id: 9,
            name: 'ANKLE',
            listOrder: 0,
            children: [],
            renderName: '발목'));
        lengthData.add(CommonModel(
            id: 10,
            name: 'LONG',
            listOrder: 0,
            children: [],
            renderName: '발등'));
        lengthData.add(CommonModel(
            id: 11,
            name: 'MAXI',
            listOrder: 0,
            children: [],
            renderName: '발등을 덮는'));
      } else if (cate1 == 2 && cate2 == 14) {
        // 치마
        lengthData.add(CommonModel(
            id: 1,
            name: 'MICRO',
            listOrder: 0,
            children: [],
            renderName: '초미니'));
        lengthData.add(CommonModel(
            id: 2,
            name: 'MINI1',
            listOrder: 0,
            children: [],
            renderName: '미니'));
        lengthData.add(CommonModel(
            id: 3,
            name: 'MINI2',
            listOrder: 0,
            children: [],
            renderName: '미니보다 긴 기장'));
        lengthData.add(CommonModel(
            id: 4, name: 'KNEE', listOrder: 0, children: [], renderName: '무릎'));
        lengthData.add(CommonModel(
            id: 5,
            name: 'MID1',
            listOrder: 0,
            children: [],
            renderName: '무릎 아래'));
        lengthData.add(CommonModel(
            id: 6,
            name: 'MID2',
            listOrder: 0,
            children: [],
            renderName: '종아리'));
        lengthData.add(CommonModel(
            id: 7,
            name: 'LONG',
            listOrder: 0,
            children: [],
            renderName: '종아리 아래'));
        lengthData.add(CommonModel(
            id: 8,
            name: 'MAXI1',
            listOrder: 0,
            children: [],
            renderName: '발목 위'));
        lengthData.add(CommonModel(
            id: 9,
            name: 'MAXI2',
            listOrder: 0,
            children: [],
            renderName: '발목'));
      } else if (cate1 == 4) {
        // 드레스
        lengthData.add(CommonModel(
            id: 1,
            name: 'MICRO',
            listOrder: 0,
            children: [],
            renderName: '초미니'));
        lengthData.add(CommonModel(
            id: 2, name: 'MINI', listOrder: 0, children: [], renderName: '미니'));
        lengthData.add(CommonModel(
            id: 3,
            name: 'KNEE1',
            listOrder: 0,
            children: [],
            renderName: '무릎 위'));
        lengthData.add(CommonModel(
            id: 4,
            name: 'KNEE2',
            listOrder: 0,
            children: [],
            renderName: '무릎 아래'));
        lengthData.add(CommonModel(
            id: 5, name: 'MID', listOrder: 0, children: [], renderName: '종아리'));
        lengthData.add(CommonModel(
            id: 6, name: 'LONG', listOrder: 0, children: [], renderName: '발목'));
        lengthData.add(CommonModel(
            id: 7, name: 'MAXI', listOrder: 0, children: [], renderName: '발등'));
      } else if (cate1 == 3 && cate2 == 19) {
        // 뷔스티에
        lengthData.add(CommonModel(
            id: 1,
            name: 'MIDRIFF',
            listOrder: 0,
            children: [],
            renderName: '가슴아래'));
        lengthData.add(CommonModel(
            id: 2,
            name: 'WAIST',
            listOrder: 0,
            children: [],
            renderName: '허리'));
      } else if (cate1 == 1 || cate1 == 3) {
        // 그외 아우터 또는 상의
        lengthData.add(CommonModel(
            id: 1,
            name: 'MIDRIFF',
            listOrder: 0,
            children: [],
            renderName: '가슴아래'));
        lengthData.add(CommonModel(
            id: 2,
            name: 'WAIST',
            listOrder: 0,
            children: [],
            renderName: '허리'));
        lengthData.add(CommonModel(
            id: 3,
            name: 'MIDDLE-HIP',
            listOrder: 0,
            children: [],
            renderName: '골반'));
        lengthData.add(CommonModel(
            id: 4,
            name: 'HIPBONE',
            listOrder: 0,
            children: [],
            renderName: '중힙'));
        lengthData.add(CommonModel(
            id: 5,
            name: 'HIP',
            listOrder: 0,
            children: [],
            renderName: '힙 아래'));
        lengthData.add(CommonModel(
            id: 6,
            name: 'THIGH',
            listOrder: 0,
            children: [],
            renderName: '허벅지'));
      }
    } else if (gender == 'M') {
      // 남성일때
      if (cate1 == 1 && cate2 == 8) {
        // 코트
        lengthData.add(CommonModel(
            id: 1,
            name: 'MIDDLE-HIP',
            listOrder: 0,
            children: [],
            renderName: '골반'));
        lengthData.add(CommonModel(
            id: 2,
            name: 'HIPBONE',
            listOrder: 0,
            children: [],
            renderName: '중힙'));
        lengthData.add(CommonModel(
            id: 3, name: 'HIP', listOrder: 0, children: [], renderName: '힙'));
        lengthData.add(CommonModel(
            id: 4,
            name: 'THIGH1',
            listOrder: 0,
            children: [],
            renderName: '허벅지 중간'));
        lengthData.add(CommonModel(
            id: 5,
            name: 'THIGH2',
            listOrder: 0,
            children: [],
            renderName: '허벅지 중간 아래'));
        lengthData.add(CommonModel(
            id: 6, name: 'KNEE', listOrder: 0, children: [], renderName: '무릎'));
        lengthData.add(CommonModel(
            id: 7, name: 'MID', listOrder: 0, children: [], renderName: '종아리'));
        lengthData.add(CommonModel(
            id: 8,
            name: 'LONG',
            listOrder: 0,
            children: [],
            renderName: '종아리 아래'));
      } else if (cate1 == 1 && cate2 == 9) {
        // 자켓
        lengthData.add(CommonModel(
            id: 1,
            name: 'MIDDLE-HIP',
            listOrder: 0,
            children: [],
            renderName: '골반'));
        lengthData.add(CommonModel(
            id: 2,
            name: 'HIPBONE',
            listOrder: 0,
            children: [],
            renderName: '중힙'));
        lengthData.add(CommonModel(
            id: 3, name: 'HIP', listOrder: 0, children: [], renderName: '힙'));
        lengthData.add(CommonModel(
            id: 4,
            name: 'THIGH1',
            listOrder: 0,
            children: [],
            renderName: '허벅지 중간'));
      } else if (cate1 == 1 && cate2 == 10) {
        // 점퍼
        lengthData.add(CommonModel(
            id: 1,
            name: ' MIDDLE-HIP',
            listOrder: 0,
            children: [],
            renderName: '골반'));
        lengthData.add(CommonModel(
            id: 2,
            name: 'HIPBONE',
            listOrder: 0,
            children: [],
            renderName: '중힙'));
        lengthData.add(CommonModel(
            id: 3, name: 'HIP', listOrder: 0, children: [], renderName: '힙'));
        lengthData.add(CommonModel(
            id: 4,
            name: 'THIGH1',
            listOrder: 0,
            children: [],
            renderName: '허벅지 중간'));
        lengthData.add(CommonModel(
            id: 5,
            name: 'THIGH2',
            listOrder: 0,
            children: [],
            renderName: '허벅지 중간 아래'));
        lengthData.add(CommonModel(
            id: 6, name: 'KNEE', listOrder: 0, children: [], renderName: '무릎'));
        lengthData.add(CommonModel(
            id: 7, name: 'MID', listOrder: 0, children: [], renderName: '종아리'));
      } else if (cate1 == 1 && cate2 == 11) {
        // 베스트
        lengthData.add(CommonModel(
            id: 1,
            name: 'MIDDLE-HIP',
            listOrder: 0,
            children: [],
            renderName: '골반'));
        lengthData.add(CommonModel(
            id: 2,
            name: 'HIPBONE',
            listOrder: 0,
            children: [],
            renderName: '중힙'));
        lengthData.add(CommonModel(
            id: 3, name: 'HIP', listOrder: 0, children: [], renderName: '힙'));
      } else if (cate1 == 1 && cate2 == 12) {
        // 가디건
        lengthData.add(CommonModel(
            id: 1,
            name: 'MIDDLE-HIP',
            listOrder: 0,
            children: [],
            renderName: '골반'));
        lengthData.add(CommonModel(
            id: 2,
            name: 'HIPBONE',
            listOrder: 0,
            children: [],
            renderName: '중힙'));
        lengthData.add(CommonModel(
            id: 3, name: 'HIP', listOrder: 0, children: [], renderName: '힙'));
        lengthData.add(CommonModel(
            id: 4,
            name: 'THIGH1',
            listOrder: 0,
            children: [],
            renderName: '허벅지 중간'));
        lengthData.add(CommonModel(
            id: 5,
            name: 'THIGH2',
            listOrder: 0,
            children: [],
            renderName: '허벅지 중간 아래'));
      } else if (cate1 == 2 && cate2 == 13) {
        // 바지
        lengthData.add(CommonModel(
            id: 1,
            name: 'SHORT',
            listOrder: 0,
            children: [],
            renderName: '짧은 기장'));
        lengthData.add(CommonModel(
            id: 2,
            name: 'KNEE1',
            listOrder: 0,
            children: [],
            renderName: '무릎 위'));
        lengthData.add(CommonModel(
            id: 3,
            name: 'KNEE2',
            listOrder: 0,
            children: [],
            renderName: '무릎 아래'));
        lengthData.add(CommonModel(
            id: 4, name: 'MID', listOrder: 0, children: [], renderName: '종아리'));
        lengthData.add(CommonModel(
            id: 5,
            name: 'ANKLE',
            listOrder: 0,
            children: [],
            renderName: '발목'));
        lengthData.add(CommonModel(
            id: 6, name: 'LONG', listOrder: 0, children: [], renderName: '발등'));
      } else if ((cate1 == 3 && cate2 == 17) ||
          (cate1 == 3 && cate2 == 18 && cate3 == 142)) {
        // 티셔츠 혹은 니트 브이넥
        lengthData.add(CommonModel(
            id: 1,
            name: 'MIDDLE-HIP',
            listOrder: 0,
            children: [],
            renderName: '골반'));
        lengthData.add(CommonModel(
            id: 2, name: 'HIP', listOrder: 0, children: [], renderName: '힙'));
        lengthData.add(CommonModel(
            id: 3,
            name: 'THIGH',
            listOrder: 0,
            children: [],
            renderName: '허벅지'));
      } else if (cate1 == 3 && cate2 == 18) {
        // 니트
        lengthData.add(CommonModel(
            id: 1,
            name: 'MIDDLE-HIP',
            listOrder: 0,
            children: [],
            renderName: '골반'));
        lengthData.add(CommonModel(
            id: 2, name: 'HIP', listOrder: 0, children: [], renderName: '힙'));
      } else if (cate1 == 3 && cate2 == 16) {
        // 셔츠
        lengthData.add(CommonModel(
            id: 1,
            name: 'MIDDLE-HIP',
            listOrder: 0,
            children: [],
            renderName: '골반'));
        lengthData.add(CommonModel(
            id: 2, name: 'HIP', listOrder: 0, children: [], renderName: '힙'));
      }
    }

    return lengthData;
  }
}
