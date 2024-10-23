import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mirror_app/pages/camera/camera_screen.dart';
import 'package:mirror_app/pages/camera/model/upload_after_image_model.dart';
import 'package:mirror_app/pages/closet/model/closet_menu_model.dart';
import 'package:mirror_app/pages/closet_detail/closet_detail_screen.dart';
import 'package:mirror_app/pages/guide_screen.dart';
import 'package:mirror_app/pages/main_screen.dart';
import 'package:mirror_app/pages/preview/preview_screen.dart';
import 'package:mirror_app/pages/qrview/qrview_screen.dart';
import 'package:mirror_app/pages/splash/splash_screen.dart';

import '../pages/closet/closet_screen.dart';

final List<RouteBase> routes = [
  // Splash Screen
  GoRoute(
    name: 'splash',
    path: '/splash',
    pageBuilder: (BuildContext context, GoRouterState state) {
      return const NoTransitionPage(
        child: SplashScreen(),
      );
    },
  ),
  // Home Screen
  GoRoute(
    name: 'home',
    path: '/home',
    pageBuilder: (BuildContext context, GoRouterState state) {
      return const NoTransitionPage(
        child: MainScreen(),
      );
    },
  ),
  // Guide Screen
  GoRoute(
    name: 'guide',
    path: '/guide',
    pageBuilder: (BuildContext context, GoRouterState state) {
      return const NoTransitionPage(
        child: GuideScreen(),
      );
    },
  ),
  // QR View Screen
  GoRoute(
    name: 'qrView',
    path: '/qrView',
    pageBuilder: (BuildContext context, GoRouterState state) {
      return const NoTransitionPage(
        child: QRViewScreen(),
      );
    },
  ),
  // Camera Screen
  GoRoute(
    name: 'camera',
    path: '/camera',
    pageBuilder: (BuildContext context, GoRouterState state) {
      return NoTransitionPage(
        child: CameraScreen(
          cameras:
              state.extra != null ? state.extra as List<CameraDescription> : [],
        ),
      );
    },
  ),
  // Preview Screen
  GoRoute(
    name: 'preview',
    path: '/preview',
    pageBuilder: (BuildContext context, GoRouterState state) {
      UploadAfterImageModel uploadModel;
      if (state.extra != null) {
        if (state.extra is UploadAfterImageModel) {
          uploadModel = state.extra as UploadAfterImageModel;
        } else if (state.extra is Map<String, dynamic>) {
          uploadModel = UploadAfterImageModel.fromJson(
              state.extra as Map<String, dynamic>);
        } else {
          uploadModel = const UploadAfterImageModel();
        }
      } else {
        uploadModel = const UploadAfterImageModel();
      }
      return NoTransitionPage(
        child: PreviewScreen(
          uploadModel: uploadModel,
        ),
      );
    },
  ),
  // Closet Screen
  GoRoute(
    name: 'closet',
    path: '/closet',
    pageBuilder: (BuildContext context, GoRouterState state) {
      return const NoTransitionPage(
        child: ClosetScreen(),
      );
    },
    routes: [
      GoRoute(
          name: 'closetDetail',
          path: "detail/:closetId",
          builder: (BuildContext cContext, GoRouterState cState) {
            ClosetMenuModel closet;
            if (cState.extra != null) {
              if (cState.extra is ClosetMenuModel) {
                closet = cState.extra as ClosetMenuModel;
              } else {
                closet = const ClosetMenuModel(
                  id: 0,
                  categoryId: 0,
                  dressType: '',
                  mainImageUrl: '',
                  verified: false,
                );
              }
            } else {
              closet = const ClosetMenuModel(
                id: 0,
                categoryId: 0,
                dressType: '',
                mainImageUrl: '',
                verified: false,
              );
            }
            return ClosetDetailScreen(
              closetId: int.parse(cState.pathParameters["closetId"]!),
              closet: closet,
            );
          }),
    ],
  ),
];

extension GoRouterExt on GoRouter {
  void popUntilPath(String routePath) {
    List routeStacks = [...routerDelegate.currentConfiguration.routes];

    for (int i = routeStacks.length - 1; i >= 0; i--) {
      RouteBase route = routeStacks[i];
      if (route is GoRoute) {
        if (route.name == routePath) break;
        if (i != 0 && routeStacks[i - 1] is ShellRoute) {
          RouteMatchList matchList = routerDelegate.currentConfiguration;
          restore(matchList.remove(matchList.matches.last));
        } else {
          pop();
        }
      }
    }
  }
}
