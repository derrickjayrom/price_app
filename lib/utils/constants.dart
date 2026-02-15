import 'package:flutter/foundation.dart';

String get emptyAssetImage => 'assets/png/empty.png';
String get localUser => 'local-users-$kDebugMode';

String get currentLatKey => 'current_lat_$kReleaseMode';
String get currentLngKey => 'current_lng_$kReleaseMode';
String get selectedLatKey => 'selected_lat_$kReleaseMode';
String get selectedLngKey => 'selected_lng_$kReleaseMode';
String get lastChosenLocation => 'last_chosen_location$kReleaseMode';
//Hive boxes
String get settingsBoxName => 'app_settings_$kDebugMode';

class PrefKeys {
  static String get showWalkThru => 'show-walkthrough-screen';
  static String get userLoggedInToken => 'token_$kDebugMode';
}
