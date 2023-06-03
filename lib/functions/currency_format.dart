import 'package:intl/intl.dart';

class CurrencyFormat {
  static String formatCurrency(double value) {
    NumberFormat priceFormat =
        NumberFormat.currency(locale: "en_IN", symbol: "₹");

    String formattedValue = priceFormat.format(value);

    if (value.truncateToDouble() == value) {
      formattedValue = formattedValue.replaceAll(RegExp(r'\.00$'), '');
    }

    return formattedValue;
  }
}
