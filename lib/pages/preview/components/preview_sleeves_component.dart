import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mirror_app/common/constants/vton_personal.dart';
import 'package:mirror_app/common/models/common_model.dart';
import 'package:mirror_app/common/storage/sleeves.dart';
import 'package:mirror_app/common/widget/item_text.dart';
import 'package:mirror_app/pages/preview/model/preview_model.dart';
import 'package:mirror_app/pages/preview/provider/preview_provider.dart';
import 'package:mirror_app/utils/common_utils.dart';

class PreviewSleevesComponent extends ConsumerStatefulWidget {
  const PreviewSleevesComponent({
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PreviewSleevesComponentState();
}

class _PreviewSleevesComponentState
    extends ConsumerState<PreviewSleevesComponent> {
  List<CommonModel> sleevesList = [];

  @override
  Widget build(BuildContext context) {
    final previewState = ref.watch(previewProvider) as PreviewModel;
    sleevesList.clear();
    String type = '';
    if (!((previewState.cate1 == 1 && previewState.cate2 != 11) ||
        previewState.cate1 == 3 ||
        previewState.cate1 == 4)) {
      return const SizedBox();
    }
    if (previewState.gender == 'F') {
      setState(() {
        var lastCategory = CommonService().getLastCategory(previewState);
        var map = createMapSleevelengthF();
        var values = findValuesForKey(map, lastCategory);
        if (values.isNotEmpty) {
          if (previewState.cate1 == 1 && previewState.cate2 != 11) {
            type = 'OUTER';
          } else if (previewState.cate1 == 3) {
            type = 'TOP';
          } else if (previewState.cate1 == 4) {
            type = 'DRESS';
          }
          sleevesList.addAll(SleevesDataStorage.getData(
              previewState.cate1, previewState.gender));
        }
      });
    } else if (previewState.gender == 'M') {
      setState(() {
        var lastCategory = CommonService().getLastCategory(previewState);
        var map = createMapSleevelengthM();
        var values = findValuesForKey(map, lastCategory);
        if (values.isNotEmpty) {
          if (previewState.cate1 == 1 && previewState.cate2 != 11) {
            type = 'MOUTER';
          } else if (previewState.cate1 == 3) {
            type = 'MTOP';
          }
          sleevesList.addAll(SleevesDataStorage.getData(
              previewState.cate1, previewState.gender));
        }
      });
    }
    return ItemTextWidget(
      title: '소매기장',
      previewModel: previewState,
      defaultItem: previewState.sleeves,
      selectedItem: CommonService().setNameByName(sleevesList),
      onItemSelected: (selectData) {
        ref
            .read(previewProvider.notifier)
            .setPreviewState('sleeves', selectData);
      },
      commonList: sleevesList,
      isItemTap: '$type-BgSelector',
    );
  }
}
