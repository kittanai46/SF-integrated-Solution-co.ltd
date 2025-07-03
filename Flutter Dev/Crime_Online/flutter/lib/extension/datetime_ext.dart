import 'package:intl/intl.dart';

extension DateTimeExt on DateTime {
  static String getCurrentDateInApiFormat() {
    final now = DateTime.now();
    return now.formatApiDateTime();
  }

  String formatApiDateTime() {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(this);
  }

  String formatUiDateTime() {
    final DateFormat formatter = DateFormat('dd/MM/yyyy');
    return formatter.format(this);
  }

  String formatUiTime() {
    final DateFormat formatter = DateFormat().add_jm();
    return formatter.format(this);
  }
}
