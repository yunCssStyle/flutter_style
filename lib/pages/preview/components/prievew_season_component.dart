import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mirror_app/common/constants/constants.dart';
import 'package:mirror_app/pages/preview/model/preview_model.dart';
import 'package:mirror_app/pages/preview/provider/preview_provider.dart';
import 'package:mirror_app/utils/common_utils.dart';

class PreviewSeasonComponent extends ConsumerStatefulWidget {
  const PreviewSeasonComponent({
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PreviewSeasonComponentState();
}

class _PreviewSeasonComponentState
    extends ConsumerState<PreviewSeasonComponent> {
  @override
  Widget build(BuildContext context) {
    final previewState = ref.watch(previewProvider) as PreviewModel;
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
                '계절',
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
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: seasonList
                    .map((season) => GestureDetector(
                          onTap: () {
                            /// 체크박스 선택 값 변경
                            var s = previewState.season.split(',');
                            if (previewState.season.contains(season)) {
                              s.remove(season);
                            } else {
                              s.add(season);
                            }
                            ref
                                .read(previewProvider.notifier)
                                .setPreviewState('season', s.join(','));
                          },
                          child: Row(
                            children: [
                              Transform.scale(
                                scale: 1.2,
                                child: Checkbox(
                                  /// 체크박스 선택 값
                                  value: previewState.season.contains(season),

                                  /// 체크박스를 누르고 있을 때 발생하는 splash 이벤트의 컬러
                                  overlayColor: const WidgetStatePropertyAll(
                                      Color.fromRGBO(98, 0, 176, 0.2)),

                                  /// splash의 크기
                                  splashRadius: 24,

                                  /// MaterialTapTargetSize.padded : 최소사이즈 48x48 로 세팅
                                  /// MaterialTapTargetSize.shrinkWrap : Material에 의해 제공된 최소 사이즈
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,

                                  /// 선택 안 됐을 때 테두리 컬러와
                                  /// 선택 됐을 때 배경 컬러 설정
                                  fillColor: WidgetStatePropertyAll(
                                      previewState.season.contains(season)
                                          ? const Color(0xFF6200B0)
                                          : const Color(0xFFCBCBCB)),

                                  /// 체크박스의 모양 변경
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  side: WidgetStateBorderSide.resolveWith(
                                    (states) => const BorderSide(
                                        width: 1.0, color: Color(0xFFCBCBCB)),
                                  ),

                                  /// 체크박스를 클릭했을 때 호출
                                  onChanged: (value) {
                                    /// 체크박스 선택 값 변경
                                    var s = previewState.season.split(',');
                                    if (previewState.season.contains(season)) {
                                      s.remove(season);
                                    } else {
                                      s.add(season);
                                    }
                                    ref
                                        .read(previewProvider.notifier)
                                        .setPreviewState('season', s.join(','));
                                  },
                                ),
                              ),
                              Text(
                                CommonService().printSeason(season),
                                style: TextStyle(
                                    color: previewState.season.contains(season)
                                        ? const Color(0xFF808080)
                                        : const Color(0xFFCBCBCB)),
                              ),
                            ],
                          ),
                        ))
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
