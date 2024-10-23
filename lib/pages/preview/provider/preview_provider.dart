import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mirror_app/pages/preview/model/classification_result_model.dart';
import 'package:mirror_app/pages/preview/model/preview_model.dart';
import 'package:mirror_app/pages/preview/model/user_dress_model.dart';
import 'package:mirror_app/pages/preview/repository/preview_repository.dart';
import 'package:mirror_app/pages/qrview/model/user_model.dart';
import 'package:mirror_app/pages/qrview/provider/user_provider.dart';

import '../../../utils/logger.dart';

final previewProvider =
    StateNotifierProvider<PreviewStateNotifier, PreviewModel?>((ref) {
  final previewRepository = ref.watch(previewRepositoryProvider);

  return PreviewStateNotifier(
    previewRepository: previewRepository,
    ref: ref,
  );
});

class PreviewStateNotifier extends StateNotifier<PreviewModel?> {
  final PreviewRepository previewRepository;
  final Ref ref;
  PreviewStateNotifier({
    required this.previewRepository,
    required this.ref,
  }) : super(const PreviewModel(
          gender: 'F',
          cate1: 0,
          cate2: 0,
          cate3: 0,
          cate4: 0,
          color: '',
          pattern: '',
          sleeves: '',
          detail: '',
          lengths: '',
          season: '',
        ));
// 초기 화면 설정
  void initState() {
    state = const PreviewModel(
      gender: 'F',
      cate1: 0,
      cate2: 0,
      cate3: 0,
      cate4: 0,
      color: '',
      pattern: '',
      sleeves: '',
      detail: '',
      lengths: '',
      season: '',
    );
  }

  // classification 가져온 값 설정 하기
  void setClassification(int id) async {
    final user = ref.read(userProvider);
    if (user is UserModel && user.id != null) {
      ClassificationResultModel? classificationResultModel =
          await previewRepository.getUserClosetList(user.id ?? 0, id);
      if (classificationResultModel != null) {
        var cate1 = classificationResultModel.categories.isNotEmpty
            ? (classificationResultModel.categories[0].id ?? 0)
            : 0;
        var cate2 = classificationResultModel.categories.length > 1
            ? (classificationResultModel.categories[1].id ?? 0)
            : 0;
        var cate3 = classificationResultModel.categories.length > 2
            ? (classificationResultModel.categories[2].id ?? 0)
            : 0;

        state = state?.copyWith(
          cate1: cate1,
          cate2: cate2,
          cate3: cate3,
          color: classificationResultModel.color ?? 'BLACK',
          pattern: 'SOLID',
          sleeves: '',
          detail: '',
          lengths: '',
          mainImageUrl: classificationResultModel.mainImageUrl,
          maskImageUrl: classificationResultModel.maskImageUrl,
          originImageUrl: classificationResultModel.originalImageUrl,
          userDressRequestId: id,
        );
      }
    }
  }

  // 업로드
  Future<bool> userDressUpload(UserDressModel model) async {
    final user = ref.read(userProvider);
    if (user is UserModel && user.id != null) {
      try {
        UserDressModel? s = await previewRepository.postUserDress(body: model);
        if (s != null) {
          if (s.categoryId != null && s.categoryId != 0) {
            return true;
          }
        }
        return false;
      } catch (e) {
        logger.e(e);
        return false;
      }
    }
    return false;
  }

  // 카테고리 선택 시 상태 변경
  void onSelectedCategory(int depth, String value) {
    if (state == null) return;
    if (depth == 0) {
      state = state?.copyWith(
        cate1: int.parse(value),
        cate2: 0,
        cate3: 0,
        cate4: 0,
      );
    }
    if (depth == 1) {
      state = state?.copyWith(
        cate2: int.parse(value),
        cate3: 0,
        cate4: 0,
      );
    }
    if (depth == 2) {
      state = state?.copyWith(
        cate3: int.parse(value),
        cate4: 0,
      );
    }
    if (depth == 3) {
      state = state?.copyWith(
        cate4: int.parse(value),
      );
    }
    state = state?.copyWith(
      sleeves: '',
      lengths: '',
      detail: '',
    );
  }

  // 일부 상태 변경
  void setPreviewState(String key, String value) {
    if (state == null) return;
    switch (key) {
      case 'cate4':
        state = state?.copyWith(cate4: int.parse(value));
        break;
      case 'color':
        state = state?.copyWith(color: value);
        break;
      case 'pattern':
        state = state?.copyWith(pattern: value);
        break;
      case 'season':
        state = state?.copyWith(season: value);
        break;
      case 'sleeves':
        state = state?.copyWith(sleeves: value);
        break;
      case 'lengths':
        state = state?.copyWith(lengths: value);
        break;
      case 'detail':
        state = state?.copyWith(detail: value);
        break;
    }
  }
}
