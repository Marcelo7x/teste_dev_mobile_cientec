import 'package:flutter/services.dart';

class InputFormatter {
  static TextInputFormatter cpfFormatter() => TextInputFormatter.withFunction(
        (oldValue, newValue) {
          final text = newValue.text;
          if (text.length > 3 && text.length <= 6) {
            return newValue.copyWith(
              text: '${text.substring(0, 3)}.${text.substring(3)}',
              selection: TextSelection.collapsed(offset: text.length + 1),
            );
          } else if (text.length > 6 && text.length <= 9) {
            return newValue.copyWith(
              text:
                  '${text.substring(0, 3)}.${text.substring(3, 6)}.${text.substring(6)}',
              selection: TextSelection.collapsed(offset: text.length + 2),
            );
          } else if (text.length > 9) {
            return newValue.copyWith(
              text:
                  '${text.substring(0, 3)}.${text.substring(3, 6)}.${text.substring(6, 9)}-${text.substring(9)}',
              selection: TextSelection.collapsed(offset: text.length + 3),
            );
          }
          return newValue;
        },
      );

  static TextInputFormatter dateFormatter() => TextInputFormatter.withFunction(
        (oldValue, newValue) {
          final text = newValue.text;
          if (text.length > 2 && text.length <= 4) {
            return newValue.copyWith(
              text: '${text.substring(0, 2)}/${text.substring(2)}',
              selection: TextSelection.collapsed(offset: text.length + 1),
            );
          } else if (text.length > 4) {
            return newValue.copyWith(
              text:
                  '${text.substring(0, 2)}/${text.substring(2, 4)}/${text.substring(4)}',
              selection: TextSelection.collapsed(offset: text.length + 2),
            );
          }
          return newValue;
        },
      );

  static TextInputFormatter phoneFormatter() => TextInputFormatter.withFunction(
        (oldValue, newValue) {
          final text = newValue.text;
          if (text.length > 2 && text.length <= 7) {
            return newValue.copyWith(
              text: '(${text.substring(0, 2)}) ${text.substring(2)}',
              selection: TextSelection.collapsed(offset: text.length + 3),
            );
          } else if (text.length > 7) {
            return newValue.copyWith(
              text:
                  '(${text.substring(0, 2)}) ${text.substring(2, 7)}-${text.substring(7)}',
              selection: TextSelection.collapsed(offset: text.length + 4),
            );
          }
          return newValue;
        },
      );
}
