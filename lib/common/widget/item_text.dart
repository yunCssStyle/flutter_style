import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mirror_app/common/models/common_model.dart';
import 'package:mirror_app/common/widget/drop_down_text.dart';
import 'package:mirror_app/pages/preview/model/preview_model.dart';

class ItemTextWidget extends StatefulWidget {
  final String title;
  final String defaultItem;
  final List<SelectedListTextItem> selectedItem;
  final String isItemTap;
  final Function(String) onItemSelected;
  final List<CommonModel> commonList;
  final PreviewModel? previewModel;

  const ItemTextWidget({
    super.key,
    required this.title,
    required this.selectedItem,
    this.defaultItem = '선택해주세요',
    this.isItemTap = 'Default',
    required this.onItemSelected,
    required this.commonList,
    this.previewModel,
  });

  @override
  State<ItemTextWidget> createState() => _ItemTextWidgetState();
}

class _ItemTextWidgetState extends State<ItemTextWidget> {
  // bg 이미지 셋팅
  String setBgImage(String type) {
    if (type.contains('BgSelector')) {
      List<String> splitText = type.split('-');
      if (splitText[0] == 'OUTER') {
        return 'assets/images/sleeves/outer';
      } else if (splitText[0] == 'TOP' || splitText[0] == 'DRESS') {
        return 'assets/images/sleeves/top-dress';
      } else if (splitText[0] == 'COAT') {
        return 'assets/images/length/coat';
      } else if (splitText[0] == 'JUMPER') {
        return 'assets/images/length/jumper';
      } else if (splitText[0] == 'VEST') {
        return 'assets/images/length/vest';
      } else if (splitText[0] == 'CARDIGAN') {
        return 'assets/images/length/cardigan';
      } else if (splitText[0] == 'PANTS') {
        return 'assets/images/length/pants';
      } else if (splitText[0] == 'SKIRT') {
        return 'assets/images/length/skirt';
      } else if (splitText[0] == 'DRESS_Length') {
        return 'assets/images/length/dress';
      } else if (splitText[0] == 'BUSTIER') {
        return 'assets/images/length/bustier';
      } else if (splitText[0] == 'TOP_Length') {
        return 'assets/images/length/top';
      }
      // 여기서부터 남자
      else if (splitText[0] == 'MOUTER') {
        return 'assets/images/sleeves/mouter';
      } else if (splitText[0] == 'MTOP') {
        return 'assets/images/sleeves/mtop';
      } else if (splitText[0] == 'MPANTS_Length') {
        return 'assets/images/length/mpants';
      } else if (splitText[0] == 'MTSHIRT_Length') {
        return 'assets/images/length/mtshirt';
      } else if (splitText[0] == 'MKNIT_Length') {
        return 'assets/images/length/mknit';
      } else if (splitText[0] == 'MSHIRT_Length') {
        return 'assets/images/length/mshirt';
      } else if (splitText[0] == 'MCOAT_Length') {
        return 'assets/images/length/mcoat';
      } else if (splitText[0] == 'MJUMPER_Length') {
        return 'assets/images/length/mjumper';
      } else if (splitText[0] == 'MCARDIGAN_Length') {
        return 'assets/images/length/mcardigan';
      } else if (splitText[0] == 'MJACKET_Length') {
        return 'assets/images/length/mjacket';
      } else if (splitText[0] == 'MVEST_Length') {
        return 'assets/images/length/mvest';
      }
    }
    return '';
  }

  void onTextTap({isGridView = 'Default'}) {
    DropDownStateText(
      DropDownText(
        inputClosetModel: widget.previewModel,
        selectedItem: widget.defaultItem,
        bottomSheetTitle: widget.title,
        data: widget.selectedItem,
        selectedItems: (List<SelectedListTextItem> selectedList) {
          setState(() {
            widget
                .onItemSelected(selectedList[0].value ?? selectedList[0].name);
          });
        },
        gridViewType: isGridView,
        commonList: widget.commonList,
        bg: setBgImage(widget.isItemTap),
      ),
    ).showModal(context);
  }

  void onColorTap() {}

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<CommonModel> findTarget =
        widget.commonList.where((e) => e.name == widget.defaultItem).toList();
    String textKo = findTarget.isNotEmpty && findTarget[0].renderName != ''
        ? findTarget[0].renderName ??
            (widget.defaultItem == '' ? '선택해주세요' : widget.defaultItem)
        : (widget.defaultItem == '' ? '선택해주세요' : widget.defaultItem);
    // logger.e('textKo:$textKo, ');
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 27.0.w, vertical: 4.0.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: Container(
              padding: EdgeInsets.only(right: 15.0.w),
              child: Text(
                textAlign: TextAlign.right,
                widget.title,
                style: TextStyle(
                  fontFamily: 'Pretendard',
                  fontSize: 16.0.w,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 3,
            fit: FlexFit.tight,
            child: GestureDetector(
              onTap: () {
                if (widget.selectedItem.isNotEmpty) {
                  FocusScope.of(context).unfocus();
                  widget.isItemTap != 'Default' &&
                          !widget.isItemTap.contains('BgSelector')
                      ? onTextTap(isGridView: widget.isItemTap)
                      : onTextTap();
                }
              },
              child: Container(
                alignment: Alignment.center,
                height: 36.w,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xFFCBCBCB),
                    width: 1.0.w,
                  ),
                  borderRadius: BorderRadius.circular(5.0.w),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        widget.selectedItem.isEmpty ? '상위 카테고리를 선택하세요' : textKo,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Pretendard',
                          fontSize: 16.0.w,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF808080),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(
                          'assets/images/main/edit_item.svg',
                          semanticsLabel: 'edit_item',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
