# mirror-app

# 개발 환경

## flutter --version

Flutter 3.22.2 • channel stable • https://github.com/flutter/flutter.git
Framework • revision 761747bfc5 (9 weeks ago) • 2024-06-05 22:15:13 +0200
Engine • revision edd8546116
Tools • Dart 3.4.3 • DevTools 2.34.3

# install

firebase cli 설치 필요
shorebird cli 설치 필요

```
flutter clean
flutter pub get
dart run build_runner build

```

# stage / prod

lib / constants / constants.dart

```dart
// stage
const String apiBaseUrl = 'https://api.stage.stage.stylebot.io';
// prod
const String apiBaseUrl = 'https://api.stage.stylebot.io';
```

# shorebird build

```
shorebird release android
shorebird release ios
```

# shorebird code push

```
shorebird patch android
shorebird patch ios
```

# shorebird deploy

```
android
shorebird release android --artifact apk


```
