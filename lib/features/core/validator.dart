class Validator {
  final List<String? Function(String)> validations = [];
  final bool optional;

  Validator({this.optional = false});

  String? Function(String?) validate() {
    return (String? value) {
      for (var validation in validations) {
        final error = validation(value ?? '');
        if (error != null) {
          return error;
        }
      }
      return null;
    };
  }

  Validator name([String? message]) {
    validations.add((String? value) {
      if ((value == null || value.isEmpty) && !optional) {
        return message ?? 'Campo obrigatório';
      } else if ((value == null || value.isEmpty) && optional) {
        return null;
      }
      return null;
    });
    return this;
  }

  Validator cpf([String? message]) {
    validations.add((String? value) {
      if ((value == null || value.isEmpty) && !optional) {
        return message ?? 'Campo obrigatório';
      } else if ((value == null || value.isEmpty) && optional) {
        return null;
      }

      if (!isValidCPF(value)) {
        return 'CPF inválido';
      }

      return null;
    });
    return this;
  }

  bool isValidCPF(String? cpf) {
    String? cpfLimpo = cpf?.replaceAll(RegExp(r'[^\d]'), '');

    if (cpfLimpo?.length != 11) {
      return false;
    }

    if (RegExp(r'^(\d)\1+$').hasMatch(cpfLimpo ?? '')) {
      return false;
    }

    int soma = 0;
    for (int i = 0; i < 9; i++) {
      soma += int.parse(cpfLimpo![i]) * (10 - i);
    }
    int digito1 = (soma % 11 < 2) ? 0 : 11 - (soma % 11);

    soma = 0;
    for (int i = 0; i < 10; i++) {
      soma += int.parse(cpfLimpo![i]) * (11 - i);
    }
    int digito2 = (soma % 11 < 2) ? 0 : 11 - (soma % 11);

    if (digito1 != int.parse(cpfLimpo![9]) ||
        digito2 != int.parse(cpfLimpo[10])) {
      return false;
    }

    return true;
  }

  Validator date([String? message]) {
    validations.add((String? value) {
      if ((value == null || value.isEmpty) && !optional) {
        return message ?? 'Campo obrigatório';
      } else if ((value == null || value.isEmpty) && optional) {
        return null;
      }

      value = value?.split('/').reversed.join('-');

      final date = DateTime.tryParse(value ?? '');
      if (date == null || date.year < 1890 || date.year > DateTime.now().year) {
        return message ?? 'Data inválida';
      }

      return null;
    });
    return this;
  }

  Validator phone([String? message]) {
    validations.add((String? value) {
      if ((value == null || value.isEmpty) && !optional) {
        return message ?? 'Campo obrigatório';
      } else if ((value == null || value.isEmpty) && optional) {
        return null;
      }

      if (!RegExp(r'^\(\d{2}\) \d{5}-\d{4}$').hasMatch(value ?? '')) {
        return message ?? 'Telefone inválido';
      }

      return null;
    });
    return this;
  }

  Validator maxLength(int length, [String? message]) {
    validations.add((String? value) {
      if ((value == null || value.isEmpty) && !optional) {
        return message ?? 'Campo obrigatório';
      } else if ((value == null || value.isEmpty) && optional) {
        return null;
      }

      if (value != null && value.length > length) {
        return message ?? 'Tamanho máximo ultrapassado';
      }
      return null;
    });

    return this;
  }
}
