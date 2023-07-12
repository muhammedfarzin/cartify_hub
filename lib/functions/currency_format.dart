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

  static int getPercentage({
    required double originalPrice,
    required double offerPrice,
  }) {
    double discount = originalPrice - offerPrice;
    double offerPercentage = (discount / originalPrice) * 100;
    return offerPercentage.floor();
  }

  static String formatNumber(double number) {
    final format = NumberFormat.compact();
    return format.format(number);
  }
}
