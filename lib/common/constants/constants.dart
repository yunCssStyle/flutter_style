const String apiBaseUrl = 'https://api.stylebot.io';
// const String apiBaseUrl = 'https://api.stage.stylebot.io';
const String appVersion = '1.1.0+4';

const double closetRatio = 1.428;

const Duration connectTimeOut = Duration(seconds: 5000); // network timeout
const Duration refreshClosetTime = Duration(seconds: 10);
// 시즌
const List<String> seasonList = ['SPRING', 'SUMMER', 'FALL', 'WINTER'];

// storage key
const String accessTokenKey = 'accessToken';
const String refreshTokenKey = 'refreshToken';
const String userKey = 'user';
