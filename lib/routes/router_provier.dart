import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mirror_app/pages/qrview/provider/auth_provider.dart';
import 'package:mirror_app/routes/router_config.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final provider = ref.read(authProvider);
  return GoRouter(
    routes: routes,
    initialLocation: '/splash',
    refreshListenable: provider,
    redirect: provider.redirectLogic,
    debugLogDiagnostics: true,
  );
});
