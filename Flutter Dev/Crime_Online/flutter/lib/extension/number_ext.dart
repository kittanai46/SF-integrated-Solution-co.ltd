import 'package:intl/intl.dart';

extension NumberFormatter on num {
  String toCurrencyFormatString() {
    final NumberFormat numberFormatter = NumberFormat('#,###');
    return numberFormatter.format(this);
  }
}
