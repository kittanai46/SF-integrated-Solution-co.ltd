import 'dart:convert';
import 'dart:ui';

import 'package:crimes/config/app_constant.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:crypto/crypto.dart';

class StringUtils {
  static String capitalize(String str) {
    if (str == null) {
      throw ArgumentError('string: $str');
    }
    if (str.isEmpty) {
      return str;
    }
    return str.substring(0, 1).toUpperCase() + str.substring(1);
  }

  static bool isValidEmail(String email) {
    final RegExp exp =
        RegExp(r'(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)');
    return exp.hasMatch(email);
  }

  static bool isValidPassword(String text) {
    return text.isNotEmpty && text.length >= 6;
  }

  static bool isValidFullName(String name) {
    String trimString = name.trim();
    List<String> fullNameArray = trimString.split(' ');
    return fullNameArray.length >= 2;
  }

  static bool isContainSpecialCharater(String value) {
    RegExp invalidCharacters = RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%-.0-9]');
    return invalidCharacters.hasMatch(value);
  }

  static List<String> extractFullName(String fullName) {
    String trimString = fullName.trim();
    int indexOfFirstSpace = trimString.indexOf(' ');
    if (indexOfFirstSpace == -1) {
      // not found space
      return [];
    }
    String firstName = trimString.substring(0, indexOfFirstSpace).trim();
    String lastName =
        trimString.substring(indexOfFirstSpace + 1, trimString.length).trim();
    return [firstName, lastName];
  }

  static String getFullName(String firstName, String lastName) {
    return [firstName, lastName].join(" ");
  }

  static String stripShortCodes(String content) {
    RegExp regExp = RegExp(
      r'\[([^<>\\[\]]+)]',
      caseSensitive: false,
      multiLine: true,
    );
    String newContent = content.replaceAllMapped(regExp, (match) {
      return '';
    });
    return newContent.trim();
  }

  static String stripMinus(String content) {
    RegExp regExp = RegExp(
      r'-',
      caseSensitive: false,
      multiLine: true,
    );
    String newContent = content.replaceAllMapped(regExp, (match) {
      return '';
    });
    return newContent.trim();
  }

  static bool isDigit(String s, int idx) =>
      "0".compareTo(s[idx]) <= 0 && "9".compareTo(s[idx]) >= 0;

  // static Color colorFromHex(String hexColor) {
  //   hexColor = hexColor.replaceAll("#", "");
  //   if (hexColor.length == 6) {
  //     hexColor = "FF" + hexColor;
  //   }
  //   if (hexColor.length == 8) {
  //     return Color(int.parse("0x$hexColor"));
  //   }
  // }

  static bool isNotEmail(String email) {
    if (email == null) {
      return true;
    }
    if (email.length < 3 ||
        !email.contains('@') ||
        email.length > 320 ||
        email.contains(',')) {
      return true;
    } else {
      return false;
    }
  }

  static bool isNull(String? text) {
    if (text == null || text.isEmpty || text.compareTo('') == 0) {
      return true;
    }else {
      return false;
    }
  }

  static bool isContainIDCardNo(String word) {
    word = word.replaceAll(new RegExp(r' '), '');
    StringUtils.log("... isContainIDCardNo: ${word} length : ${word.length}");

    RegExp regExp = new RegExp(r"(\d{13})", multiLine: false);
    //RegExp regExp = new RegExp(r"(\d{1}) (\d{4}) (\d{5}) (\d{2}) (\d{1})", multiLine: false);

    bool hasMatch = regExp.hasMatch(word);
    StringUtils.log("... isContainIDCardNo hasMatch: ${hasMatch}");
    if(hasMatch){
      String chkWord = getTextContainIDCardNo(word);
      hasMatch = isIDCardNo(chkWord);
    }
    return hasMatch;
  }

  static String getTextContainIDCardNo(String word) {
    String idCard = "";
    word = word.replaceAll(new RegExp(r' '), '');
    RegExp regExp = new RegExp(r"(\d{13})", multiLine: false);
    // RegExp regExp = new RegExp(r"(\d{1}) (\d{4}) (\d{5}) (\d{2}) (\d{1})", multiLine: false);

    RegExpMatch? match = regExp.firstMatch(word);
    idCard = word.substring(match!.start, match.end);
    return idCard;
  }

  static bool isIDCardNo(String iPID) {
    int total = 0;
    int chk;
    iPID = iPID.replaceAll(new RegExp(r'-'), '');
    iPID = iPID.replaceAll(new RegExp(r' '), '');
    iPID = iPID.trim();
    if(iPID.length!=13){
      return false;
    }

    String Validchk = iPID.substring(12);
    int pidcut;
    for (int i = 0; i < 12; i++) {
      pidcut = int.parse(iPID.substring(i, i+1));
      total = (total + ((pidcut) * (13 - i)));
    }
    chk = 11 - (total % 11);

    if (chk == 10) {
      chk = 0;
    } else if (chk == 11) {
      chk = 1;
    }

    if (chk.toString() == Validchk) {
      return true;
    } else {
      return false;
    }

  }

  static var _logger = Logger(printer: PrettyPrinter(),);
  static void log(String message, {bool error = false}) {
    // allLogs.add(message);
    if(!AppConstant.isDebug) return;

    int defaultPrintLength = 1020;
    if (message == null || message.length <= defaultPrintLength) {
      !error ? _logger.d(message): _logger.e(message);
    } else {
      String log = message.toString();
      int start = 0;
      int endIndex = defaultPrintLength;
      int logLength = log.length;
      int tmpLogLength = log.length;
      while (endIndex < logLength) {
        !error ? _logger.d(log.substring(start, endIndex)): _logger.e(log.substring(start, endIndex));
        endIndex += defaultPrintLength;
        start += defaultPrintLength;
        tmpLogLength -= defaultPrintLength;
      }
      if (tmpLogLength > 0) {
        !error ? _logger.d(log.substring(start, logLength)): _logger.e(log.substring(start, logLength));
      }
    }
  }

  static String generateMd5(String input) {
    return md5.convert(utf8.encode(input)).toString();
  }

  static String convertDateYYYYMMDD(String input){
    var arrMonth = ["ม.ค.","ก.พ.","มี.ค.","เม.ย.","พ.ค.","มิ.ย.","ก.ค.","ส.ค.","ก.ย.","ต.ค.","พ.ย.","ธ.ค."];
    try {
      int y = int.parse(input.substring(0, 4));
      if (y < 2400) {
        y += 543;
      }
      int m = int.parse(input.substring(4, 6));
      int d = int.parse(input.substring(6, 8));
      return '${d} ${arrMonth[m - 1]} ${y}';
    }catch(e){
      return input;
    }
  }

  static int countDaysYYYYMMDD(String input){
    try {
      int y = int.parse(input.substring(0, 4));
      if (y > 2400) {
        y -= 543;
      }
      int m = int.parse(input.substring(4, 6));
      int d = int.parse(input.substring(6, 8));
      var parsedDate = DateFormat('y-M-d hh:mm:ss', 'en_US').parse('${y}-${m}-${d} 23:59:59');
      var diffDt = parsedDate.difference(DateTime.now());
      return diffDt.inDays;
    }catch(e){
      return -1;
    }
  }
}
