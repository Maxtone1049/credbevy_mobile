import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class SharedPreferencesService {
  SharedPreferencesService._internal();

  // final _log = getLogger('SharedPreferencesService');

  SharedPreferences? sharedPreferences;

  static final SharedPreferencesService _instance =
      SharedPreferencesService._internal();

  factory SharedPreferencesService() => _instance;

  static SharedPreferencesService get instance => _instance;

  Future<void> initilize() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static const String keyAuthToken = 'auth_token';
  static const String logginKey = 'loggin';
  static const String userData = 'user';
  static const String userDataBalance = 'userBalance';
  static const String biometricKey = 'biometricKey';
  static const String found401erorr = 'found401erorr';

  String get authToken => sharedPreferences?.getString(keyAuthToken) ?? '';

  bool get isLoggedIn => sharedPreferences?.getBool(logginKey) ?? false;

  bool get setBiometric => sharedPreferences?.getBool(biometricKey) ?? false;
  set setBiometric(bool enable) =>
      sharedPreferences?.setBool(biometricKey, enable);
  bool get isFound401erorr =>
      sharedPreferences?.getBool(found401erorr) ?? false;

  set isFound401erorr(bool login) =>
      sharedPreferences?.setBool(found401erorr, login);

  Map<String, dynamic> get usersData {
    final userDataString = sharedPreferences?.getString(userData);
    if (userDataString != null && userDataString.isNotEmpty) {
      return json.decode(userDataString);
    }
    return {};
  }

  Map<String, dynamic> get usersDataBalance {
    final userDatainfo = sharedPreferences?.getString(userDataBalance);
    if (userDatainfo != null && userDatainfo.isNotEmpty) {
      return json.decode(userDatainfo);
    }
    return {};
  }

  set isLoggedIn(bool logging) =>
      sharedPreferences?.setBool(logginKey, logging);

  set authToken(String authToken) =>
      sharedPreferences?.setString(keyAuthToken, authToken);
  set usersData(Map<String, dynamic>? map) =>
      sharedPreferences?.setString(userData, json.encode(map));
  set usersDataBalance(Map<String, dynamic>? map) =>
      sharedPreferences?.setString(userDataBalance, json.encode(map));

  Future<bool> logOut() async {
    await sharedPreferences!.clear();
    await sharedPreferences?.reload();
    // try {
    //   final cacheDir = await getTemporaryDirectory();
    //   if (cacheDir.existsSync()) {
    //     cacheDir.deleteSync(recursive: true);
    //   }
    //   final appDir = await getApplicationSupportDirectory();
    //   if (appDir.existsSync()) {
    //     appDir.deleteSync(recursive: true);
    //   }
    // } catch (e) {
    //   _log.e("error clearing cache");
    // }
    return true;
  }
}
