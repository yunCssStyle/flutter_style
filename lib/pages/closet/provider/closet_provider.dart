import 'dart:async';
import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mirror_app/common/constants/closet_menu.dart';
import 'package:mirror_app/common/constants/constants.dart';
import 'package:mirror_app/pages/closet/model/closet_group_list_model.dart';
import 'package:mirror_app/pages/closet/repository/closet_repository.dart';
import 'package:mirror_app/pages/qrview/model/user_model.dart';
import 'package:mirror_app/pages/qrview/provider/user_provider.dart';
import 'package:mirror_app/utils/logger.dart';

final closetProvider =
    StateNotifierProvider<ClosetStateNotifier, ClosetGroupListModelBase?>(
        (ref) {
  final closetRepository = ref.watch(closetRepositoryProvider);

  return ClosetStateNotifier(
    closetRepository: closetRepository,
    ref: ref,
  );
});

class ClosetStateNotifier extends StateNotifier<ClosetGroupListModelBase?> {
  final ClosetRepository closetRepository;
  final Ref ref;
  ClosetStateNotifier({
    required this.closetRepository,
    required this.ref,
  }) : super(ClosetGroupListLoading());

  Future<void> resetClosetGroup() async {
    state = ClosetGroupListLoading();
  }

  Future<ClosetGroupListModelBase?> initClosetGroup(String gender) async {
    if (gender == 'M') {
      state = const ClosetGroupListModel(
        closetGroupList: manClosetGroup,
      );
    } else {
      state = const ClosetGroupListModel(
        closetGroupList: feClosetGroup,
      );
    }
    return state;
  }

  Future<void> getClosetLoadBackground(int index, Timer timer) async {
    final closet = state as ClosetGroupListModel;
    try {
      final user = ref.read(userProvider);
      if (user is UserModel && user.id != null) {
        final closetResponse = await closetRepository.getUserClosetList(
            user.id ?? 0, closet.closetGroupList[index].id);
        final updatedClosetGroup = closet.closetGroupList[index].copyWith(
          isLoad: true,
          closetList: closetResponse,
        );
        state = ClosetGroupListModel(
          closetGroupList: [
            for (int i = 0; i < closet.closetGroupList.length; i++)
              if (i == index) updatedClosetGroup else closet.closetGroupList[i]
          ],
        );
        if (closetResponse.every((item) => item.verified)) {
          timer.cancel();
        }
      }
    } catch (e) {
      logger.i('getClosetLoadBackground error: $e');
    }
  }

  void checkAndStartTimer(int index) {
    Timer.periodic(refreshClosetTime, (timer) {
      getClosetLoadBackground(index, timer);
    });
  }

  Future<ClosetGroupListModelBase> closetLoad(int index,
      {bool refresh = false}) async {
    final closet = state as ClosetGroupListModel;
    try {
      final user = ref.read(userProvider);
      if (user is UserModel && user.id != null) {
        if (refresh || !closet.closetGroupList[index].isLoad) {
          final closetResponse = await closetRepository.getUserClosetList(
              user.id ?? 0, closet.closetGroupList[index].id);

          if (closetResponse.where((test) => !test.verified).isNotEmpty) {
            checkAndStartTimer(index);
          }

          final updatedClosetGroup = closet.closetGroupList[index].copyWith(
            isLoad: true,
            closetList: closetResponse,
          );
          return state = ClosetGroupListModel(
            closetGroupList: [
              for (int i = 0; i < closet.closetGroupList.length; i++)
                if (i == index)
                  updatedClosetGroup
                else
                  closet.closetGroupList[i]
            ],
          );
        }
      }
      return closet;
    } catch (e) {
      return closet;
    }
  }

  Future<void> deleteUserCloset(int index, List<int> closetIds) async {
    try {
      final user = ref.read(userProvider);
      if (user is UserModel && user.id != null) {
        logger.e('closetIds$closetIds');
        await closetRepository.deleteUserCloset(
            user.id ?? 0, json.encode(closetIds));
        closetLoad(index, refresh: true);
      }
    } catch (e) {
      logger.i('deleteUserCloset error: $e');
    }
  }
}
