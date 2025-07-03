import 'dart:convert';
import 'dart:typed_data';

import 'package:crimes/config/app_constant.dart';
import 'package:crimes/data/client/request/encrypt_request_dto.dart';
import 'package:crimes/util/string_utils.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sodium_libs/sodium_libs.dart';

import '../main.dart';

class CryptoUtils {

  static Future<EncryptRequestDto> encrypt(dynamic data) async {
    String payload = json.encode(data);

    String? clientSecretKey = await FlutterSecureStorage().read(key: AppConstant.kClientSecretKey);
    String? serverPublicKey = await FlutterSecureStorage().read(key: AppConstant.kServerPublicKey);
    if(clientSecretKey==null || serverPublicKey==null) throw Exception("Key not found");

    Uint8List clientSecretByte = Base64Decoder().convert(clientSecretKey);
    Uint8List serverPublicByte = Base64Decoder().convert(serverPublicKey);
    SecureKey secureKey = SecureKey.fromList(sodium, clientSecretByte);

    List<int> list = utf8.encode(payload);
    Uint8List body = Uint8List.fromList(list);
    Uint8List nonceByte = sodium.randombytes.buf(sodium.crypto.box.nonceBytes);

    Uint8List cipherByte = sodium.crypto.box.easy(
      message: body,
      nonce: nonceByte,
      publicKey: serverPublicByte,
      secretKey: secureKey,
    );
    String cipher = Base64Encoder().convert(cipherByte);  // Base64 String cipher
    String nonce = Base64Encoder().convert(nonceByte);    // Base64 String nonce

    //print byte
    StringUtils.log("cipher: $cipher");
    StringUtils.log("nonce: $nonce");

    return EncryptRequestDto(data: cipher, nonce: nonce);
  }

  static Future<String> decrypt(String cipher, String nonce) async {
    String? clientSecretKey = await FlutterSecureStorage().read(key: AppConstant.kClientSecretKey);
    String? serverPublicKey = await FlutterSecureStorage().read(key: AppConstant.kServerPublicKey);

    Uint8List clientSecretByte = Base64Decoder().convert(clientSecretKey!);
    Uint8List serverPublicByte = Base64Decoder().convert(serverPublicKey!);
    SecureKey secureKey = SecureKey.fromList(sodium, clientSecretByte);

    Uint8List cipherBytes = Base64Decoder().convert(cipher);
    Uint8List nonceBytes = Base64Decoder().convert(nonce);

    Uint8List dataByte = sodium.crypto.box.openEasy(
        cipherText: cipherBytes,
        nonce: nonceBytes,
        publicKey: serverPublicByte,
        secretKey: secureKey
    );
    String decodedText = utf8.decode(dataByte);
    //StringUtils.log("decodedText: $decodedText");

    return decodedText;
  }

}
