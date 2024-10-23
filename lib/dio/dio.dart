import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mirror_app/dio/dio_utils.dart';
import 'package:mirror_app/utils/logger.dart';

import '../common/constants/constants.dart';

class CustomInterceptor extends Interceptor {
  final FlutterSecureStorage storage;
  final Ref ref;

  CustomInterceptor({
    required this.storage,
    required this.ref,
  });

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    await DioUtils.requestHead(options.headers, storage);
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    logger.i('[uri] ${response.requestOptions.uri}, data: ${response.data}');
    return super.onResponse(response, handler);
  }

  int weaponCount = 0;
  int roundCount = 0;
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    logger.e('[ERR] [${err.requestOptions.method}] ${err.requestOptions.uri}');

    final refreshToken = await storage.read(key: refreshTokenKey);
    if (refreshToken == null) {
      return handler.reject(err);
    }

    final isStatus401 = err.response?.statusCode == 401;

    if (isStatus401) {
      final dio = Dio();

      try {
        final res = await dio.post(
          '$apiBaseUrl/api/sign-in/token',
          data: {'refreshToken': refreshToken},
        );
        final accessToken = res.data['accessToken'];

        final options = err.requestOptions;

        // 토큰 변경하기
        options.headers.addAll({
          'authorization': 'Bearer $accessToken',
        });

        await storage.write(key: accessTokenKey, value: accessToken);

        // 요청 재전송
        final response = await dio.fetch(options);
        logger.i('response: $response');
        return handler.resolve(response);
      } on DioException catch (e) {
        return handler.reject(e);
      }
    }
    return handler.reject(err);
  }
}
