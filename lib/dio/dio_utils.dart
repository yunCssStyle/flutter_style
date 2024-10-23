import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../common/constants/constants.dart';

class DioUtils {
  static dynamic requestHead(
      dynamic headers, FlutterSecureStorage storage) async {
    if (headers.containsKey('accessToken') == true) {
      headers.remove('accessToken');
      final token = await storage.read(key: accessTokenKey);
      headers["Authorization"] = "Bearer $token";
    }
  }
}
