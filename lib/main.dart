import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mirror_app/firebase_options.dart';
import 'package:mirror_app/routes/router_provier.dart';

void catchUnhandledExceptions(Object error, StackTrace? stack) {
  FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
  debugPrintStack(stackTrace: stack, label: error.toString());
}

void main() {
  // ignore: unused_element
  runZonedGuarded(() async {
    WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    FlutterError.onError = (FlutterErrorDetails details) {
      catchUnhandledExceptions(details.exception, details.stack);
    };

    runApp(
      const ProviderScope(
        child: MyApp(),
      ),
    );
  }, catchUnhandledExceptions);
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  Widget build(BuildContext context) {
    final router = ref.watch(routerProvider);
    return ScreenUtilInit(
      designSize: Size(MediaQuery.of(context).size.width,
          MediaQuery.of(context).size.height), // design size
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp.router(
          scaffoldMessengerKey: GlobalKey<ScaffoldMessengerState>(),
          debugShowCheckedModeBanner: false,
          title: 'Style Mirror',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          routerConfig: router,
        );
      },
    );
  }
}
