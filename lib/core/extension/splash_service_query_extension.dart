import '../constants/enums/splash_check_enum.dart';

extension SplashServiceQueryExtension on SplashServiceQuery {
  MapEntry<String, String> toMapValue(String value) {
    switch (this) {
      case SplashServiceQuery.PLATFORM:
        return MapEntry('platform', value);
      case SplashServiceQuery.VERSION:
        return MapEntry('version', value);
    }
  }
}
