import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mirror_app/common/constants/vton_personal.dart';
import 'package:mirror_app/common/models/common_model.dart';
import 'package:mirror_app/common/storage/length.dart';
import 'package:mirror_app/common/widget/item_text.dart';
import 'package:mirror_app/pages/preview/model/preview_model.dart';
import 'package:mirror_app/pages/preview/provider/preview_provider.dart';
import 'package:mirror_app/utils/common_utils.dart';

class PreviewLengthComponent extends ConsumerStatefulWidget {
  const PreviewLengthComponent({
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PreviewLengthComponentState();
}

class _PreviewLengthComponentState
    extends ConsumerState<PreviewLengthComponent> {
  final List<CommonModel> lengthList = [];

  @override
  Widget build(BuildContext context) {
    // 몸판 기장 관련
    final previewState = ref.watch(previewProvider) as PreviewModel;
    String type = '';
    lengthList.clear();
    if (previewState.gender == 'F') {
      if (previewState.cate1 == 1 && previewState.cate2 == 8) {
        // 코트
        setState(() {
          type = 'COAT';
        });
      } else if (previewState.cate1 == 1 && previewState.cate2 == 10) {
        // 점퍼
        setState(() {
          type = 'JUMPER';
        });
      } else if (previewState.cate1 == 1 && previewState.cate2 == 11) {
        // 베스트
        setState(() {
          type = 'VEST';
        });
      } else if (previewState.cate1 == 1 && previewState.cate2 == 12) {
        // 가디건
        setState(() {
          type = 'CARDIGAN';
        });
      } else if (previewState.cate1 == 2 && previewState.cate2 == 13) {
        // 바지
        setState(() {
          type = 'PANTS';
        });
      } else if (previewState.cate1 == 2 && previewState.cate2 == 14) {
        // 치마
        setState(() {
          type = 'SKIRT';
        });
      } else if (previewState.cate1 == 4) {
        // 드레스
        setState(() {
          type = 'DRESS_Length';
        });
      } else if (previewState.cate1 == 3 && previewState.cate2 == 19) {
        // 뷔스티에
        setState(() {
          type = 'BUSTIER';
        });
      } else if (previewState.cate1 == 1 || previewState.cate1 == 3) {
        // 그외 아우터 또는 상의
        setState(() {
          type = 'TOP_Length';
        });
      }
      var lastCategory = CommonService().getLastCategory(previewState);
      var map = createMapBodylengthF();
      var values = findValuesForKey(map, lastCategory);
      if (values.isNotEmpty) {
        lengthList.addAll(LengthDataStorage.getData(previewState));
      }
    } else if (previewState.gender == 'M') {
      if (previewState.cate1 == 2 && previewState.cate2 == 13) {
        // 바지
        setState(() {
          type = 'MPANTS_Length';
        });
      } else if (previewState.cate1 == 3 && previewState.cate2 == 17 ||
          previewState.cate1 == 3 &&
              previewState.cate2 == 18 &&
              previewState.cate3 == 142) {
        // 티셔츠 혹은 니트의 브이넥
        setState(() {
          type = 'MTSHIRT_Length';
        });
      } else if (previewState.cate1 == 3 && previewState.cate2 == 18) {
        // 니트
        setState(() {
          type = 'MKNIT_Length';
        });
      } else if (previewState.cate1 == 3 && previewState.cate2 == 16) {
        // 셔츠
        setState(() {
          type = 'MSHIRT_Length';
        });
      }
      if (previewState.cate1 == 1 && previewState.cate2 == 8) {
        // 코트
        setState(() {
          type = 'MCOAT_Length';
        });
      } else if (previewState.cate1 == 1 && previewState.cate2 == 10) {
        // 점퍼
        setState(() {
          type = 'MJUMPER_Length';
        });
      } else if (previewState.cate1 == 1 && previewState.cate2 == 12) {
        // 가디건
        setState(() {
          type = 'MCARDIGAN_Length';
        });
      } else if (previewState.cate1 == 1 && previewState.cate2 == 9) {
        // 자켓
        setState(() {
          type = 'MJACKET_Length';
        });
      } else if (previewState.cate1 == 1 && previewState.cate2 == 11) {
        // 베스트
        setState(() {
          type = 'MVEST_Length';
        });
      }
      var lastCategory = CommonService().getLastCategory(previewState);
      var map = createMapBodylengthM();
      var values = findValuesForKey(map, lastCategory);
      if (values.isNotEmpty) {
        lengthList.addAll(LengthDataStorage.getData(previewState));
      }
    }
    return ItemTextWidget(
      title: '총 장',
      previewModel: previewState,
      defaultItem: previewState.lengths,
      selectedItem: CommonService().setNameByName(lengthList),
      onItemSelected: (selectData) {
        ref
            .read(previewProvider.notifier)
            .setPreviewState('lengths', selectData);
      },
      commonList: lengthList,
      isItemTap: '$type-BgSelector',
    );
  }
}
