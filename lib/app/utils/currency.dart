import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class CurrencyFormat extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    double value = double.parse(newValue.text);
    final money = NumberFormat("#,###,###", "en_US");

    String newText = money.format(value);
    int lgth = newText.length;

    return newValue.copyWith(
        text: newText, selection: TextSelection.collapsed(offset: lgth));
  }
}
