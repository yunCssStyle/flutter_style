import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mirror_app/common/storage/secure_storage.dart';
import 'package:mirror_app/dio/dio.dart';

import '../common/constants/constants.dart';

final dioProvider = Provider<Dio>((ref) {
  var dio = Dio();
  dio.options.connectTimeout = connectTimeOut; //5s
  var options = BaseOptions(
    connectTimeout: connectTimeOut,
  );

  dio = Dio(options);
  final storage = ref.watch(secureStorageProvider);

  dio.interceptors.add(
    CustomInterceptor(storage: storage, ref: ref),
  );

  return dio;
});
