import 'package:flutter_test/flutter_test.dart';
import 'package:teste_dev_mobile_cientec/features/core/validator.dart';

void main() {
  group('Validator', () {
    test('should validate name field as required', () {
      final validator = Validator().name();
      final result = validator.validate()('');
      expect(result, 'Campo obrigatório');
    });

    test('should validate CPF field as required and invalid', () {
      final validator = Validator().cpf();
      final result = validator.validate()('');
      expect(result, 'Campo obrigatório');

      const invalidCPF = '123.456.789-00';
      final resultInvalid = validator.validate()(invalidCPF);
      expect(resultInvalid, 'CPF inválido');
    });

    test('should validate CPF field as valid', () {
      final validator = Validator();
      const validCPF = '096.912.030-30'; // Replace with a valid CPF for testing
      final resultValid = validator.validate()(validCPF);
      expect(resultValid, null);
    });

    test('should validate date field as required and invalid', () {
      final validator = Validator().date();
      final result = validator.validate()('');
      expect(result, 'Campo obrigatório');

      const invalidDate = '30/02/2021';
      final resultInvalid = validator.validate()(invalidDate);
      expect(resultInvalid, 'Data inválida');
    });

    test('should validate date field as valid', () {
      final validator = Validator().date();
      const validDate = '28/02/2021';
      final resultValid = validator.validate()(validDate);
      expect(resultValid, null);
    });

    test('should empty date field as valid when is optional', () {
      final validator = Validator(optional: true).date();
      const emptyDate = '';
      final resultValid = validator.validate()(emptyDate);
      expect(resultValid, null);
    });

    test('should validate phone field as required and invalid', () {
      final validator = Validator().phone();
      final result = validator.validate()('');
      expect(result, 'Campo obrigatório');

      const invalidPhone = '1234567890';
      final resultInvalid = validator.validate()(invalidPhone);
      expect(resultInvalid, 'Telefone inválido');
    });

    test('should validate phone field as valid', () {
      final validator = Validator().phone();
      const validPhone = '(12) 34567-8901';
      final resultValid = validator.validate()(validPhone);
      expect(resultValid, null);
    });

    test('should validate maxLength field as required and exceeded', () {
      final validator = Validator().maxLength(5);
      final result = validator.validate()('');
      expect(result, 'Campo obrigatório');

      const exceededLength = '123456';
      final resultExceeded = validator.validate()(exceededLength);
      expect(resultExceeded, 'Tamanho máximo ultrapassado');
    });

    test('should validate maxLength field as valid', () {
      final validator = Validator().maxLength(5);
      const validLength = '12345';
      final resultValid = validator.validate()(validLength);
      expect(resultValid, null);
    });
  });
}

