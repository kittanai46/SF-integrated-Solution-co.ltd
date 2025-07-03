import 'package:crimes/data/entity/form_detail.dart';

class GroupResult {
  GroupResult({
    this.category,
    this.title,
    this.resultArray,
    this.errorMessage,
  });

  String? category;
  String? title;
  List<Result>? resultArray;
  String? errorMessage;
}

class Result {
  Result({
    this.title,
    this.line1,
    this.line2,
    this.formArray,
    this.data,
    this.excelTitle,
    this.excelValue,
  });

  String? title;
  String? line1;
  String? line2;
  List<FormDetail>? formArray;
  dynamic data;

  List<String>? excelTitle;
  List<String>? excelValue;

}