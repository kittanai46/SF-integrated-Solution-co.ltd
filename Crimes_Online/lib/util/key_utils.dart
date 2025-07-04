import 'dart:convert';
import 'dart:math';

import 'package:crimes/config/app_constant.dart';
import 'package:crimes/data/dto/profile/eula_dto.dart';
import 'package:crimes/data/dto/profile/favorite_dto.dart';
import 'package:crimes/util/string_utils.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sodium_libs/sodium_libs.dart';

import '../main.dart';

class KeyUtils {
  static final Random _random = Random.secure();

  static String createCryptoRandomString([int length = 32]) {
    var values = List<int>.generate(length, (i) => _random.nextInt(256));

    return base64Url.encode(values);
  }

  static Future<String> generateBiometricToken() async {
    return createCryptoRandomString();
  }

  static Future<KeyPair> generateKeyPair() async {
    KeyPair keyPair = await sodium.crypto.box.keyPair();
    String _clientPublicKey = Base64Encoder().convert(keyPair.publicKey);
    SecureKey secureKey = keyPair.secretKey;
    String _clientSecretKey = Base64Encoder().convert(secureKey.extractBytes());
    return keyPair;
  }

  static Future<bool> isUsernameAndKeysAvailable() async {
    String? username = await FlutterSecureStorage().read(key: AppConstant.kUsername);
    String? cookie = await FlutterSecureStorage().read(key: AppConstant.kCookie); // need atleast one service setup
    String? clientPublicKey = await FlutterSecureStorage().read(key: AppConstant.kClientPublicKey);
    String? clientSecretKey = await FlutterSecureStorage().read(key: AppConstant.kClientSecretKey);
    String? serverPublicKey = await FlutterSecureStorage().read(key: AppConstant.kServerPublicKey);
    String? biometricsToken = await FlutterSecureStorage().read(key: AppConstant.kBiometricToken);

    StringUtils.log("=================================================");
    StringUtils.log("username: $username");
    StringUtils.log("cookie: $cookie");
    StringUtils.log("clientPublicKey: $clientPublicKey");
    StringUtils.log("clientSecretKey: $clientSecretKey");
    StringUtils.log("serverPublicKey: $serverPublicKey");
    StringUtils.log("biometricsToken: $biometricsToken");
    StringUtils.log("=================================================");

    if(StringUtils.isNull(username)
        || StringUtils.isNull(cookie)
        || StringUtils.isNull(clientPublicKey)
        || StringUtils.isNull(clientSecretKey)
        || StringUtils.isNull(serverPublicKey)) {
      return false;
    }else {
      return true;
    }
  }

  static Future<void> clearAll() async {
    StringUtils.log("=====> CLEAR KEYS <=====");
    try {
      await FlutterSecureStorage().delete(key: AppConstant.kUsername);
      await FlutterSecureStorage().delete(key: AppConstant.kCookie);
      await FlutterSecureStorage().delete(key: AppConstant.kClientPublicKey);
      await FlutterSecureStorage().delete(key: AppConstant.kClientSecretKey);
      await FlutterSecureStorage().delete(key: AppConstant.kServerPublicKey);
      await FlutterSecureStorage().delete(key: AppConstant.kBiometricToken);
      await FlutterSecureStorage().delete(key: AppConstant.kFavorite);
      await FlutterSecureStorage().delete(key: AppConstant.kEulaVersion);
    } on Exception catch (_) {
    }
  }

  static Future<void> saveKeys(String clientPublicKey, String clientSecretKey, String serverPublicKey) async {
    try {
      await FlutterSecureStorage().write(key: AppConstant.kClientPublicKey, value: clientPublicKey);
      await FlutterSecureStorage().write(key: AppConstant.kClientSecretKey, value: clientSecretKey);
      await FlutterSecureStorage().write(key: AppConstant.kServerPublicKey, value: serverPublicKey);
    } on Exception catch (_) {
    }
  }

  static Future<void> saveUsername(String username) async {
    try {
      await FlutterSecureStorage().write(key: AppConstant.kUsername, value: username);
    } on Exception catch (_) {
    }
  }
  static Future<String> getUsername() async {
    String? username = "";
    try {
      username = await FlutterSecureStorage().read(key: AppConstant.kUsername);
    } on Exception catch (_) {
    }
    if(username == null) username = "";
    return username;
  }

  static Future<void> saveThaidResult(String ThaidResult) async {
    try {
      await FlutterSecureStorage().write(key: AppConstant.kThaidResult, value: ThaidResult);
    } on Exception catch (_) {
    }
  }
  static Future<String> getThaidResult() async {
    String? ThaidResult = "";
    try {
      ThaidResult = await FlutterSecureStorage().read(key: AppConstant.kThaidResult);
    } on Exception catch (_) {
    }
    if(ThaidResult == null) ThaidResult = "";
    return ThaidResult;
  }

  static Future<void> saveThaidState(String ThaidState) async {
    try {
      await FlutterSecureStorage().write(key: AppConstant.kThaidState, value: ThaidState);
    } on Exception catch (_) {
    }
  }
  static Future<String> getThaidState() async {
    String? ThaidState = "";
    try {
      ThaidState = await FlutterSecureStorage().read(key: AppConstant.kThaidState);
    } on Exception catch (_) {
    }
    if(ThaidState == null) ThaidState = "";
    return ThaidState;
  }

  static Future<void> saveThaidCode(String ThaidCode) async {
    try {
      await FlutterSecureStorage().write(key: AppConstant.kThaidCode, value: ThaidCode);
    } on Exception catch (_) {
    }
  }
  static Future<String> getThaidCode() async {
    String? ThaidCode = "";
    try {
      ThaidCode = await FlutterSecureStorage().read(key: AppConstant.kThaidCode);
    } on Exception catch (_) {
    }
    if(ThaidCode == null) ThaidCode = "";
    return ThaidCode;
  }

  static Future<bool> isMockUser() async {
    bool isMock = false;
    try {
      String? username = await getUsername();
      if(username!=null && username=="CR0001") isMock = true;
    } on Exception catch (_) {
    }
    return isMock;
  }

  static Future<bool> isBiometricsTokenAvailable() async {
    String? biometricsToken = await FlutterSecureStorage().read(key: AppConstant.kBiometricToken);
    if(StringUtils.isNull(biometricsToken)) {
      return false;
    }else {
      return true;
    }
  }
  static Future<void> saveBiometricsToken(String token) async {
    try {
      await FlutterSecureStorage().write(key: AppConstant.kBiometricToken, value: token);
    } on Exception catch (_) {
    }
  }
  static Future<String> getBiometricsToken() async {
    String? token = "";
    try {
      token = await FlutterSecureStorage().read(key: AppConstant.kBiometricToken);
    } on Exception catch (_) {
    }
    if(token == null) token = "";
    return token;
  }

  static Future<bool> isLogin() async {
    String? isLogin = await FlutterSecureStorage().read(key: AppConstant.kIsLogin);
    if(StringUtils.isNull(isLogin) || isLogin == "false") {
      return false;
    }else {
      return true;
    }
  }
  static Future<void> saveLogin(bool isLogin) async {
    String isLoginText = "true";
    if(!isLogin) isLoginText = "false";
    try {
      await FlutterSecureStorage().write(key: AppConstant.kIsLogin, value: isLoginText);
    } on Exception catch (_) {
    }
  }

  static Future<void> saveFavoriteListString(String favoriteListString) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString(AppConstant.kFavorite, favoriteListString);
    } on Exception catch (_) {
    }
  }
  static Future<List<FavoriteDto>> getFavoriteList() async {
    List<FavoriteDto>? favoristList = [];
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? favoriteListString = await prefs.getString(AppConstant.kFavorite);
      if(favoriteListString == null) favoriteListString = "[]";
      favoristList = ListFavoriteDto.fromJson(jsonDecode(favoriteListString)).data;
    } on Exception catch (_) {
    }
    if(favoristList == null) favoristList = [];
    return favoristList;
  }

  static Future<bool> isNewEulaVersion(String apiVersion) async {
    bool isNew = false;
    if(apiVersion == null || apiVersion.isEmpty){
      return isNew;
    }

    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? deviceVersion = await prefs.getString(AppConstant.kEulaVersion);
      if(deviceVersion == null || deviceVersion.isEmpty || double.parse(deviceVersion) < double.parse(apiVersion)){
        isNew = true;
      }
    } on Exception catch (_) {
    }
    return isNew;
  }
  static Future<void> saveEulaVersion(String version) async {
    if(version == null || version.isEmpty){
      version = "";
    }

    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString(AppConstant.kEulaVersion, version);
    } on Exception catch (_) {
    }
  }

  static Future<void> checkFirstTimeInstalled() async {
    String? fcmToken = await FirebaseMessaging.instance.getToken();
    StringUtils.log('BEFORE fcmToken: ${fcmToken}');
    if(fcmToken!=null && fcmToken.isNotEmpty) fcmToken = StringUtils.generateMd5(fcmToken);
    StringUtils.log('AFTER fcmToken: ${fcmToken}');

    String? installed = await FlutterSecureStorage().read(key: AppConstant.kInstalled);
    if(installed==null || installed.isEmpty){
      await FlutterSecureStorage().write(key: AppConstant.kInstalled, value: fcmToken);
      StringUtils.log('FIRST TIME INSTALL !!!');
    }else if(installed!=null && installed.isNotEmpty && fcmToken!=null && fcmToken.isNotEmpty && installed!=fcmToken){
      await clearAll();
      await FlutterSecureStorage().write(key: AppConstant.kInstalled, value: fcmToken);
      StringUtils.log('DELETE APP !!!');
    }else{
      StringUtils.log('SECOND INSTALLED !!!');
    }
  }
}
