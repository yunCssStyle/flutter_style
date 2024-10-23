import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mirror_app/common/models/common_model.dart';
import 'package:mirror_app/common/storage/category_storage.dart';
import 'package:mirror_app/common/storage/color_storage.dart';
import 'package:mirror_app/common/storage/pattern.dart';
import 'package:mirror_app/common/widget/drop_down_text.dart';
import 'package:mirror_app/pages/closet/model/closet_menu_model.dart';
import 'package:mirror_app/pages/preview/model/preview_model.dart';

class CommonService {
  static const storage = FlutterSecureStorage();

  // 여자 카테고리 셋팅하는 함수
  List<CommonModel> getFemaleCategoryList() {
    CategoryDataStorage.setUpData();
    List<CommonModel> categoryList = CategoryDataStorage.categoryDataF;
    return categoryList;
  }

  // 남자 카테고리 셋팅하는 함수
  List<CommonModel> getMaleCategoryList() {
    CategoryDataStorage.setUpData();
    List<CommonModel> categoryList = CategoryDataStorage.categoryDataM;
    return categoryList;
  }

  int getClosetCategoryByCategory1AndCategory2(
      int category1, int category2, String gender) {
    if (category1 == 1 && category2 == 11) {
      if (gender == 'M') {
        return 1011; // vest
      } else {
        return 1002; // vest
      }
    } else if (category1 == 1) {
      if (gender == 'M') {
        return 1010; // outer
      } else {
        return 1001; // outer
      }
    } else if (category1 == 3) {
      if (gender == 'M') {
        return 1012; // top
      } else {
        return 1004; // top
      }
    } else if (category1 == 4) {
      return 1003; // dress
    } else if (category1 == 2 && category2 == 13) {
      if (gender == 'M') {
        return 1013; // pants
      } else {
        return 1005; // pants
      }
    } else if (category1 == 2 && category2 == 14) {
      return 1006; // skirt
    }
    return 0; // acc
  }

  // closet category number 셋팅 하는 함수
  int getClosetCategory(List<int> categories) {
    if (categories.contains(1)) {
      if (categories.contains(11)) {
        return 1002; // vest
      }
      return 1001; // outer
    }
    if (categories.contains(4)) {
      return 1003; // dress
    }
    if (categories.contains(13)) {
      return 1005; // pants
    }
    if (categories.contains(14)) {
      return 1006; // skirt
    }
    if (categories.contains(3)) {
      return 1004; // top
    }
    return 1007; // acc
  }

  //
  // 성별 가져오기
  List<CommonModel> getGenderList() {
    List<CommonModel> genderList = [
      CommonModel(
          id: 1, name: 'F', renderName: '여성', listOrder: 0, children: []),
      CommonModel(
          id: 2, name: 'M', renderName: '남성', listOrder: 1, children: []),
    ];
    return genderList;
  }

  // 성별 리스트를 SelectedListTextItem으로 변환하는 함수
  List<SelectedListTextItem> findGenderById(List<CommonModel> genderData) {
    List<SelectedListTextItem> genderList = genderData
        .map((e) =>
            SelectedListTextItem(name: e.renderName ?? '', value: e.name))
        .toList();
    return genderList;
  }

  // 카테고리 리스트를 SelectedListTextItem으로 변환하는 함수
  List<SelectedListTextItem> convertCategoryListToSelectedListTextItem(
      List<CommonModel> categoryList) {
    List<SelectedListTextItem> list = [];
    for (CommonModel category in categoryList) {
      list.add(SelectedListTextItem(
        name: category.name,
        value: category.id.toString(),
      ));
    }
    return list;
  }

  // 카테고리에서 해당 id 의 children을 찾는 함수
  List<CommonModel> findChildrenById(int id, List<CommonModel> categoryList) {
    List<CommonModel> children = [];
    for (CommonModel category in categoryList) {
      if (category.id == id) {
        children.addAll(category.children);
        return children;
      }
      if (category.children.isNotEmpty) {
        children.addAll(findChildrenById(id, category.children)); // 재귀 호출
      }
    }
    return children;
  }

  // 한글로 텍스트 변환
  String printKo(String name, List<CommonModel> list) {
    String result = '';
    for (CommonModel category in list) {
      if (category.name == name) {
        result = category.renderName!;
        return result;
      }
      if (category.children.isNotEmpty) {
        result = printKo(name, category.children);
      }
    }
    return result;
  }

  // 아이디로 이름 찾는 함수
  String findCommonNameById(int id, List<CommonModel> categoryList) {
    String result = '선택해주세요';
    for (CommonModel category in categoryList) {
      if (category.id == id) {
        result = category.name;
        return result;
      }
      if (category.children.isNotEmpty) {
        result = findCommonNameById(id, category.children);
      }
    }
    return result;
  }

  // 배열에 이름 찾는 함수
  String findCommonName(String name, List<CommonModel> categoryList) {
    String result = '선택해주세요';
    for (CommonModel category in categoryList) {
      if (category.name == name) {
        result = category.name;
        return result;
      }
      if (category.children.isNotEmpty) {
        result = findCommonName(name, category.children);
      }
    }
    return result;
  }

  // 컬러 가져오는 함수
  List<CommonModel> getColorList() {
    ColorDataStorage.setUpData();
    List<CommonModel> categoryList = ColorDataStorage.colorData;
    return categoryList;
  }

  // 컬러 이름으로 color 값 셋팅 하는 함수
  String getColorCode(String colorName) {
    switch (colorName) {
      case "WHITE":
        return 'ffffff';
      case "GREY":
        return 'bebebe';
      case "CHARCOAL":
        return '707070';
      case "BLACK":
        return '000000';
      case "IVORY":
        return 'fffff0';
      case "BEIGE":
        return 'cdb48c';
      case "SKY BLUE":
        return '9fd3ff';
      case "BLUE":
        return '1601ff';
      case "NAVY":
        return '06008c';
      case "BROWN":
        return '673301';
      case "CAMEL":
        return 'be7e29';
      case "WINE":
        return '6f0028';
      case "KHAKI":
        return '597248';
      case "LIGHT PINK":
        return 'f5dbe0';
      case "PINK":
        return 'ff99cc';
      case "RED":
        return 'ff0002';
      case "ORANGE":
        return 'fc6600';
      case "SALMON":
        return 'faa994';
      case "YELLOW":
        return 'fff164';
      case "LAVENDER":
        return 'd6bffe';
      case "PURPLE":
        return '9701cb';
      case "MINT":
        return 'a2f8ca';
      case "LIGHT GREEN":
        return 'a7d840';
      case "GREEN":
        return '298c2b';
      case "SILVER":
        return 'c0c0c0';
      case "GOLD":
        return 'ffd700';
      default:
        return 'ffffff';
    }
  }

  // color 값으로 컬러명으로 변환 하는 함수
  String getColorName(String colorCode) {
    switch (colorCode) {
      case 'ffffff':
        return "WHITE";
      case 'bebebe':
        return "GREY";
      case '707070':
        return "CHARCOAL";
      case '000000':
        return "BLACK";
      case 'fffff0':
        return "IVORY";
      case 'cdb48c':
        return "BEIGE";
      case '9fd3ff':
        return "SKY BLUE";
      case '1601ff':
        return "BLUE";
      case '06008c':
        return "NAVY";
      case '673301':
        return "BROWN";
      case 'be7e29':
        return "CAMEL";
      case '6f0028':
        return "WINE";
      case '597248':
        return "KHAKI";
      case 'f5dbe0':
        return "LIGHT PINK";
      case 'ff99cc':
        return "PINK";
      case 'ff0002':
        return "RED";
      case 'fc6600':
        return "ORANGE";
      case 'faa994':
        return "SALMON";
      case 'fff164':
        return "YELLOW";
      case 'd6bffe':
        return "LAVENDER";
      case '9701cb':
        return "PURPLE";
      case 'a2f8ca':
        return "MINT";
      case 'a7d840':
        return "LIGHT GREEN";
      case '298c2b':
        return "GREEN";
      case 'c0c0c0':
        return "SILVER";
      case 'ffd700':
        return "GOLD";
      default:
        return "WHITE";
    }
  }

  // 계절 관련
  String printSeason(String name) {
    switch (name) {
      case 'SPRING':
        return '봄';
      case 'SUMMER':
        return '여름';
      case 'FALL':
        return '가을';
      case 'WINTER':
        return '겨울';
      default:
        return '-';
    }
  }

  String removeCommaSeason(String seasons) {
    if (seasons.startsWith(',')) {
      seasons = seasons.substring(1);
    }
    if (seasons.endsWith(',')) {
      seasons = seasons.substring(0, seasons.length - 1);
    }
    return seasons;
  }

  // 실질적으로 컬러 리스트를 SelectedListTextItem으로 변환하는 함수
  List<SelectedListTextItem> findColorById(List<CommonModel> colorData) {
    List<SelectedListTextItem> colorList = colorData
        .map((e) =>
            SelectedListTextItem(name: e.name, value: getColorCode(e.name)))
        .toList();
    return colorList;
  }

  // 패턴 가져오기
  List<CommonModel> getPatternList() {
    PatternDataStorage.setUpData();
    List<CommonModel> patternList = PatternDataStorage.patternData;
    return patternList;
  }

  // 실질적으로 컬러 리스트를 SelectedListTextItem으로 변환하는 함수
  List<SelectedListTextItem> setNameByName(List<CommonModel> list) {
    List<SelectedListTextItem> commonList = list
        .map((e) => SelectedListTextItem(name: e.name, value: e.name))
        .toList();
    return commonList;
  }

  // 선택된 카테고리 항목의 마지막 카테고리 구하는 함수
  int getLastCategory(PreviewModel inputClosetModel) {
    if (inputClosetModel.cate4 != 0) {
      return inputClosetModel.cate4;
    }
    if (inputClosetModel.cate3 != 0) {
      return inputClosetModel.cate3;
    }
    if (inputClosetModel.cate2 != 0) {
      return inputClosetModel.cate2;
    }
    if (inputClosetModel.cate1 != 0) {
      return inputClosetModel.cate1;
    }
    return 0;
  }

  // 내옷 인지 확인하는 함수
  bool isClosetItem(ClosetMenuModel product) {
    if (product.type == 'USER' || product.dressType == 'USER') {
      return true;
    } else {
      return false;
    }
  }
}
