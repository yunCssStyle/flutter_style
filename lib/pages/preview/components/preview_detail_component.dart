import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mirror_app/common/constants/vton_personal.dart';
import 'package:mirror_app/common/models/common_model.dart';
import 'package:mirror_app/common/storage/detail.dart';
import 'package:mirror_app/common/widget/item_text.dart';
import 'package:mirror_app/pages/preview/model/preview_model.dart';
import 'package:mirror_app/pages/preview/provider/preview_provider.dart';
import 'package:mirror_app/utils/common_utils.dart';

class PreviewDetailComponent extends ConsumerStatefulWidget {
  const PreviewDetailComponent({
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PreviewDetailComponentState();
}

class _PreviewDetailComponentState
    extends ConsumerState<PreviewDetailComponent> {
  // 네크라인 관련
  final List<CommonModel> detailList = [];

  @override
  Widget build(BuildContext context) {
    // 몸판 기장 관련
    final previewState = ref.watch(previewProvider) as PreviewModel;
    detailList.clear();
    if (previewState.gender == 'F') {
      if (previewState.cate1 == 1 ||
          previewState.cate1 == 3 ||
          previewState.cate1 == 4) {
        // 아우터, 탑, 드레스, 베스트
        var lastCategory = CommonService().getLastCategory(previewState);
        var map = createMapDetailF();
        var values = findValuesForKey(map, lastCategory);
        if (values.isNotEmpty) {
          detailList.addAll(DetailDataStorage.getData(previewState.cate1));
        }
        return ItemTextWidget(
          title: '네크라인',
          defaultItem: previewState.detail,
          selectedItem: CommonService().setNameByName(detailList),
          onItemSelected: (selectData) {
            ref
                .read(previewProvider.notifier)
                .setPreviewState('detail', selectData);
          },
          commonList: detailList,
        );
      }
    } else if (previewState.gender == 'M') {
      if (previewState.cate1 == 1 || previewState.cate1 == 3) {
        // 아우터, 탑, 드레스, 베스트
        var lastCategory = CommonService().getLastCategory(previewState);
        var map = createMapDetailM();
        var values = findValuesForKey(map, lastCategory);
        if (values.isNotEmpty) {
          detailList.addAll(DetailDataStorage.getData(previewState.cate1));
        }
        return ItemTextWidget(
          title: '네크라인',
          defaultItem: previewState.detail,
          selectedItem: CommonService().setNameByName(detailList),
          onItemSelected: (selectData) {
            ref
                .read(previewProvider.notifier)
                .setPreviewState('detail', selectData);
          },
          commonList: detailList,
        );
      }
    }

    return const SizedBox();
  }
}
