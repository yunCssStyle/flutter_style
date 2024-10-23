import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mirror_app/pages/closet_detail/model/closet_product_item_model.dart';
import 'package:mirror_app/pages/closet_detail/repository/closet_detail_repository.dart';
import 'package:mirror_app/pages/qrview/model/user_model.dart';
import 'package:mirror_app/pages/qrview/provider/user_provider.dart';
import 'package:mirror_app/utils/logger.dart';

final closetDetailProvider =
    StateNotifierProvider<ClosetDetailStateNotifier, ClosetProductModelBase?>(
        (ref) {
  final closetDetailRepository = ref.watch(closetDetailRepositoryProvider);

  return ClosetDetailStateNotifier(
    closetDetailRepository: closetDetailRepository,
    ref: ref,
  );
});

class ClosetDetailStateNotifier extends StateNotifier<ClosetProductModelBase?> {
  final ClosetDetailRepository closetDetailRepository;
  final Ref ref;
  ClosetDetailStateNotifier({
    required this.closetDetailRepository,
    required this.ref,
  }) : super(const ClosetProductModel());

  void getUserCloset(int userDressId) async {
    try {
      final user = ref.read(userProvider);
      if (user is UserModel && user.id != null) {
        final closetResponse = await closetDetailRepository.getUserClosetItem(
            user.id ?? 0, userDressId);
        state = ClosetProductModel(
          type: 'closet',
          productModel: null,
          closetModel: closetResponse,
        );
      }
    } catch (e) {
      logger.e(e.toString());
      state = const ClosetProductModel();
    }
  }

  void getProductItem(int productId) async {
    try {
      final productResponse =
          await closetDetailRepository.getProductItem(productId);
      logger.e(productResponse.toString());
      state = ClosetProductModel(
        type: 'product',
        closetModel: null,
        productModel: productResponse,
      );
    } catch (e) {
      logger.e(e.toString());
      state = const ClosetProductModel();
    }
  }
}
