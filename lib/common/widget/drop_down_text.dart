import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:mirror_app/common/models/common_model.dart';
import 'package:mirror_app/common/widget/horizontal_dashed_divider.dart';
import 'package:mirror_app/pages/preview/model/preview_model.dart';
import 'package:mirror_app/utils/common_utils.dart';
import 'package:mirror_app/utils/logger.dart';

import '../constants/vton_personal.dart';

class SelectedListTextItem {
  bool? isSelected;
  String name;
  String? value;

  SelectedListTextItem({
    required this.name,
    this.value,
    this.isSelected,
  });

  @override
  String toString() {
    return 'SelectedListTextItem{name: $name, value: $value}';
  }
}

typedef SelectedItemsCallBack = Function(
    List<SelectedListTextItem> selectedItems);
typedef ListItemBuilder = Widget Function(SelectedListTextItem item);
typedef BottomSheetListener = bool Function(
    DraggableScrollableNotification draggableScrollableNotification);

class DropDownText {
  final List<SelectedListTextItem> data;
  final SelectedItemsCallBack? selectedItems;
  final ListItemBuilder? listItemBuilder;
  final String? bottomSheetTitle;
  final String? selectedItem;
  final Widget? submitButtonChild;
  final TextFormField? searchWidget;
  final Color dropDownBackgroundColor;
  final String? searchHintText;
  final bool isDismissible;
  final BottomSheetListener? bottomSheetListener;
  final bool useRootNavigator;
  final String gridViewType;
  final List<CommonModel> commonList;
  final String? bg;
  final PreviewModel? inputClosetModel;

  DropDownText({
    Key? key,
    this.inputClosetModel,
    required this.data,
    this.selectedItems,
    this.listItemBuilder,
    this.bottomSheetTitle,
    this.isDismissible = true,
    this.submitButtonChild,
    this.searchWidget,
    this.searchHintText = 'Search',
    this.dropDownBackgroundColor = Colors.transparent,
    this.bottomSheetListener,
    this.useRootNavigator = false,
    this.selectedItem,
    this.gridViewType = 'Default',
    this.commonList = const [],
    this.bg = '',
  });
}

class DropDownStateText {
  DropDownText dropDown;

  DropDownStateText(this.dropDown);

  void showModal(context) {
    showModalBottomSheet(
      backgroundColor: Colors.white,
      useRootNavigator: dropDown.useRootNavigator,
      isScrollControlled: true,
      enableDrag: dropDown.isDismissible,
      isDismissible: dropDown.isDismissible,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
      ),
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return MainBody(dropDown: dropDown);
          },
        );
      },
    );
  }
}

class MainBody extends StatefulWidget {
  final DropDownText dropDown;

  const MainBody({required this.dropDown, super.key});

  @override
  State<MainBody> createState() => _MainBodyState();
}

class _MainBodyState extends State<MainBody> {
  List<SelectedListTextItem> mainList = [];

  @override
  void initState() {
    super.initState();
    mainList = widget.dropDown.data;
    _setSearchWidgetListener();
  }

// 컬러 데코레이션 설정
  BoxDecoration _buildDecorationColor(SelectedListTextItem item) {
    // 골드
    if (item.name == 'GOLD') {
      return BoxDecoration(
        gradient: const LinearGradient(
            begin: AlignmentDirectional.topCenter,
            end: AlignmentDirectional.bottomCenter,
            stops: [0.17, 0.5, 0.75],
            colors: [Color(0xfffbe19b), Color(0x00ffffff), Color(0xfff6df9e)]),
        borderRadius: BorderRadius.circular(50),
        border: Border.all(
          color: const Color(0xFFC4C4C4),
        ),
      );
    }
    // 실버
    if (item.name == 'SILVER') {
      BoxDecoration(
        gradient: const LinearGradient(
            begin: AlignmentDirectional.topCenter,
            end: AlignmentDirectional.bottomCenter,
            stops: [0.17, 0.5, 0.75],
            colors: [Color(0xffbebebe), Color(0xfff5f5f5), Color(0xffbebebe)]),
        borderRadius: BorderRadius.circular(50),
        border: Border.all(
          color: const Color(0xFFC4C4C4),
        ),
      );
    }
    return BoxDecoration(
      color: Color(0xFF000000 + int.parse(item.value ?? '0', radix: 16)),
      borderRadius: BorderRadius.circular(50),
      border: Border.all(
        color: const Color(0xFFC4C4C4),
      ),
    );
    // 그외
  }

  // 패턴 데코레이션 설정
  BoxDecoration _buildDecorationPattern(SelectedListTextItem item) {
    if (item.name == 'SOLID') {
      return BoxDecoration(
        borderRadius: BorderRadius.circular(6.w),
        border: Border.all(
          color: const Color(0xFFC4C4C4),
        ),
      );
    }
    return BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/images/patterns/${item.name}.png'),
        fit: BoxFit.cover,
      ),
      borderRadius: BorderRadius.circular(6.w),
      border: Border.all(
        color: const Color(0xFFC4C4C4),
      ),
    );
  }

  // 클릭 가능 여부 확인하는 함수
  bool isClickable(int index) {
    if (widget.dropDown.inputClosetModel == null) {
      return true;
    }
    if (widget.dropDown.bottomSheetTitle == '총 장') {
      var selectedCategoryId =
          CommonService().getLastCategory(widget.dropDown.inputClosetModel!);
      if (selectedCategoryId != 0) {
        var map = widget.dropDown.inputClosetModel!.gender == "M"
            ? createMapBodylengthM()
            : createMapBodylengthF();
        var values = findValuesForKey(map, selectedCategoryId);
        String selectText = mainList[index].name.trim();
        if (values.isNotEmpty && !values.contains(selectText)) {
          logger.e(
              'selectedCategoryId:$selectedCategoryId, values: $values, selectText: $selectText, ch:${values.isNotEmpty && !values.contains(selectText)}');
          return false;
        } else {
          logger.w(
              'selectedCategoryId:$selectedCategoryId, values: $values, selectText: $selectText, ch:${values.isNotEmpty && !values.contains(selectText)}');
        }
      }
    } else if (widget.dropDown.bottomSheetTitle == '소매기장') {
      var selectedCategoryId =
          CommonService().getLastCategory(widget.dropDown.inputClosetModel!);
      if (selectedCategoryId != 0) {
        var map = widget.dropDown.inputClosetModel!.gender == "M"
            ? createMapSleevelengthM()
            : createMapSleevelengthF();
        var values = findValuesForKey(map, selectedCategoryId);
        String selectText = mainList[index].name;
        if (values.isNotEmpty && !values.contains(selectText)) {
          logger.e(
              'selectedCategoryId:$selectedCategoryId, values: $values, selectText: $selectText, ch:${values.isNotEmpty && !values.contains(selectText)}');
          return false;
        } else {
          logger.w(
              'selectedCategoryId:$selectedCategoryId, values: $values, selectText: $selectText, ch:${values.isNotEmpty && !values.contains(selectText)}');
        }
      }
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    // 높이 계산
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double part = 58.w * mainList.length + 70.w;
    if (widget.dropDown.bottomSheetTitle == '패턴') {
      part = (screenWidth / 5 * 1.4) * (mainList.length / 5).ceil() + 70.w;
    } else if (widget.dropDown.bottomSheetTitle == '색상') {
      part = (screenWidth / 6) * (mainList.length / 6).ceil() + 70.w;
    }
    double percentage = (part / screenHeight);
    return NotificationListener<DraggableScrollableNotification>(
      onNotification: widget.dropDown.bottomSheetListener,
      child: DraggableScrollableSheet(
        initialChildSize: 0.9 > percentage ? percentage : 0.9,
        minChildSize: 0.13 > percentage ? percentage : 0.13,
        maxChildSize: 0.9 > percentage ? percentage : 0.9,
        expand: false,
        builder: (BuildContext context, ScrollController scrollController) {
          return Column(
            children: <Widget>[
              Container(
                decoration: const BoxDecoration(
                    border: Border(
                  bottom: BorderSide(
                    color: Color(0xFFEAEAEA),
                    width: 1.0,
                  ),
                )),
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 15.0.w, right: 5.0.w, top: 10.0.w, bottom: 10.0.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          widget.dropDown.bottomSheetTitle ?? '',
                          style: TextStyle(
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0.w,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                          iconSize: 24.w,
                          onPressed: _onUnFocusKeyboardAndPop,
                          icon: const Icon(Icons.clear),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: widget.dropDown.gridViewType == 'Default'
                    ?
                    // 텍스트 형태 -> 카테고리, 기장 정보
                    ListView.builder(
                        controller: scrollController,
                        itemCount: mainList.length,
                        itemBuilder: (context, index) {
                          List<CommonModel> findTarget = widget
                              .dropDown.commonList
                              .where((e) => e.name == mainList[index].name)
                              .toList();
                          String textKo = findTarget.isNotEmpty &&
                                  findTarget[0].renderName != ''
                              ? findTarget[0].renderName ?? mainList[index].name
                              : mainList[index].name;
                          // 클릭 가능한 여부 확인
                          bool clickable = isClickable(index);
                          return InkWell(
                            onTap: () {
                              if (clickable) {
                                widget.dropDown.selectedItems
                                    ?.call([mainList[index]]);
                                _onUnFocusKeyboardAndPop();
                              }
                            },
                            focusColor: clickable
                                ? const Color(0xFFC600FF)
                                : Colors.transparent,
                            hoverColor: clickable
                                ? const Color(0xFFC600FF)
                                : Colors.transparent,
                            highlightColor: clickable
                                ? const Color(0xFFC600FF)
                                : Colors.transparent,
                            child: Stack(
                              clipBehavior: Clip.hardEdge,
                              children: [
                                widget.dropDown.bg != null &&
                                        widget.dropDown.bg != ''
                                    ? Positioned(
                                        right: 0,
                                        height: 58.w,
                                        child: Image.asset(
                                          '${widget.dropDown.bg}_${index + 1}.png',
                                          height: 58.w,
                                          fit: BoxFit.fitHeight,
                                        ))
                                    : const SizedBox(),
                                Container(
                                  height: 58.w,
                                  decoration: widget.dropDown.bg == ''
                                      ? BoxDecoration(
                                          color: widget.dropDown.selectedItem ==
                                                  mainList[index].name
                                              ? const Color.fromRGBO(
                                                  198, 0, 255, 0.15)
                                              : widget.dropDown
                                                  .dropDownBackgroundColor,
                                        )
                                      : BoxDecoration(
                                          gradient: LinearGradient(
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                            colors:
                                                widget.dropDown.selectedItem ==
                                                        mainList[index].name
                                                    ? [
                                                        const Color.fromRGBO(
                                                            198, 0, 255, 0),
                                                        const Color.fromRGBO(
                                                            198, 0, 255, 0),
                                                        const Color.fromRGBO(
                                                            198, 0, 255, 0),
                                                        const Color.fromRGBO(
                                                            198, 0, 255, 0),
                                                        const Color.fromRGBO(
                                                            198, 0, 255, 0),
                                                        const Color.fromRGBO(
                                                            198, 0, 255, 0),
                                                        const Color.fromRGBO(
                                                            198, 0, 255, 0.08),
                                                        const Color.fromRGBO(
                                                            198, 0, 255, 0.30),
                                                      ]
                                                    : [
                                                        const Color.fromRGBO(
                                                            198, 0, 255, 0),
                                                        const Color.fromRGBO(
                                                            198, 0, 255, 0),
                                                        const Color.fromRGBO(
                                                            198, 0, 255, 0),
                                                      ],
                                          ),
                                        ),
                                  child: Padding(
                                    padding: widget.dropDown.bg != null &&
                                            widget.dropDown.bg != ''
                                        ? EdgeInsets.fromLTRB(19.w, 0, 0, 0)
                                        : const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                    child: ListTile(
                                      title: widget.dropDown.listItemBuilder
                                              ?.call(mainList[index]) ??
                                          (widget.dropDown.bg != null &&
                                                  widget.dropDown.bg != '' &&
                                                  !(widget.dropDown.bg ==
                                                          'assets/images/length/pants' ||
                                                      widget.dropDown.bg ==
                                                          'assets/images/length/mpants')
                                              ? Row(
                                                  children: [
                                                    Expanded(
                                                      child:
                                                          HorizontalDashedDivider(
                                                        space: 1.w,
                                                        length: 5.w,
                                                        color: const Color(
                                                            0xFF5e5e5e),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 21.w,
                                                    ),
                                                    Text(
                                                      textKo,
                                                      textAlign: widget.dropDown
                                                                      .bg !=
                                                                  null &&
                                                              widget.dropDown
                                                                      .bg !=
                                                                  ''
                                                          ? TextAlign.right
                                                          : TextAlign.center,
                                                      style: TextStyle(
                                                        color: clickable
                                                            ? Colors.black
                                                            : const Color
                                                                .fromRGBO(
                                                                0, 0, 0, 0.2),
                                                        fontFamily:
                                                            'Pretendard',
                                                        fontSize: 18.0.w,
                                                      ),
                                                    )
                                                  ],
                                                )
                                              : Text(
                                                  textKo,
                                                  textAlign: widget.dropDown
                                                                  .bg !=
                                                              null &&
                                                          widget.dropDown.bg !=
                                                              ''
                                                      ? TextAlign.right
                                                      : TextAlign.center,
                                                  style: TextStyle(
                                                    color: clickable
                                                        ? Colors.black
                                                        : const Color.fromRGBO(
                                                            0, 0, 0, 0.2),
                                                    fontFamily: 'Pretendard',
                                                    fontSize: 18.0.w,
                                                  ),
                                                )),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      )
                    :
                    // 그리드 뷰 형태 -> 패턴, 색상
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        child: GridView.builder(
                            itemCount: mainList.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              // 1 개의 행에 보여줄 item 개수
                              crossAxisCount:
                                  widget.dropDown.gridViewType == 'Pattern'
                                      ? 5 // pattern 일때
                                      : 6, // color 일때
                              //item 의 가로 1, 세로 1 의 비율
                              childAspectRatio:
                                  widget.dropDown.gridViewType == 'Pattern'
                                      ? 1 / 1.4 // pattern 일때
                                      : 1 / 1, // color 일때
                              mainAxisSpacing: 10, //수평 Padding
                              crossAxisSpacing: 10, //수직 Padding
                            ),
                            itemBuilder: (context, index) {
                              List<CommonModel> findTarget = widget
                                  .dropDown.commonList
                                  .where((e) => e.name == mainList[index].name)
                                  .toList();
                              String textKo = findTarget.isNotEmpty &&
                                      findTarget[0].renderName != ''
                                  ? findTarget[0].renderName ??
                                      mainList[index].name
                                  : mainList[index].name;
                              return InkWell(
                                onTap: () {
                                  widget.dropDown.selectedItems
                                      ?.call([mainList[index]]);
                                  _onUnFocusKeyboardAndPop();
                                },
                                child: Center(
                                  child: Column(
                                    children: [
                                      Container(
                                        width: widget.dropDown.gridViewType ==
                                                'Pattern'
                                            ? 60.w
                                            : 34.w,
                                        height: widget.dropDown.gridViewType ==
                                                'Pattern'
                                            ? 60.w
                                            : 34.w,
                                        decoration:
                                            widget.dropDown.gridViewType ==
                                                    'Pattern'
                                                ? _buildDecorationPattern(
                                                    mainList[index])
                                                : _buildDecorationColor(
                                                    mainList[index]),
                                        child: widget.dropDown.selectedItem ==
                                                mainList[index].name
                                            ? const Icon(Icons.check)
                                            : const SizedBox(),
                                      ),
                                      widget.dropDown.gridViewType == 'Pattern'
                                          ? Center(
                                              child: Text(
                                                textKo,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  color: widget.dropDown
                                                              .selectedItem ==
                                                          mainList[index].name
                                                      ? const Color(0xFF9701CB)
                                                      : Colors.black,
                                                  fontFamily: 'Pretendard',
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 11.0.sp,
                                                ),
                                              ),
                                            )
                                          : const SizedBox(),
                                    ],
                                  ),
                                ),
                              );
                            }),
                      ),
              ),
            ],
          );
        },
      ),
    );
  }

  _buildSearchList(String userSearchTerm) {
    final results = widget.dropDown.data
        .where((element) =>
            element.name.toLowerCase().contains(userSearchTerm.toLowerCase()))
        .toList();
    if (userSearchTerm.isEmpty) {
      mainList = widget.dropDown.data;
    } else {
      mainList = results;
    }
    setState(() {});
  }

  /// This helps to UnFocus the keyboard & pop from the bottom sheet.
  _onUnFocusKeyboardAndPop() {
    FocusScope.of(context).unfocus();
    context.pop();
  }

  void _setSearchWidgetListener() {
    TextFormField? searchField = widget.dropDown.searchWidget;
    searchField?.controller?.addListener(() {
      _buildSearchList(searchField.controller?.text ?? '');
    });
  }
}
