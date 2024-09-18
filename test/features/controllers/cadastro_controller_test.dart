import 'package:flutter_test/flutter_test.dart';
import 'package:teste_dev_mobile_cientec/features/controllers/registration_controller.dart';
import 'package:teste_dev_mobile_cientec/features/core/app_state.dart';
import 'package:teste_dev_mobile_cientec/features/models/recipient_enum.dart';
import 'package:teste_dev_mobile_cientec/features/models/person_interface.dart';
import 'package:teste_dev_mobile_cientec/features/models/service_enum.dart';

void main() {
  group('CadastroController', () {
    late RegistrationController controller;

    setUp(() {
      controller = RegistrationController();
    });

    test('estado inicial é ReadyState', () {
      expect(controller.state.value, isA<ReadyState>());
    });

    test('createPerson define _person corretamente', () {
      const name = 'John Doe';
      const cpf = '123.456.789-00';
      const date = '01/01/2000';
      const phone = '1234567890';

      controller.createPerson(name: name, cpf: cpf, date: date, phone: phone);

      expect(controller.person, isA<PersonInterface>());
      expect(controller.person!.name, name);
      expect(controller.person!.cpf, cpf);
      expect(controller.person!.date, date);
      expect(controller.person!.phone, phone);
    });

    test('setServico deve definir o serviço', () {
      controller.setServico(ServiceEnum.encaminhamento);

      expect(controller.servico, ServiceEnum.encaminhamento);
    });

    test('setMotivo deve definir o motivo', () {
      controller.setMotivo('Test Reason');

      expect(controller.motivo, 'Test Reason');
    });

    test('setDestinatario deve definir o destinatário', () {
      controller.setDestinatario(RecipientEnum.defensoriaPublica);

      expect(controller.destinatario, RecipientEnum.defensoriaPublica);
    });

    test(
        'encaminhar deve definir o estado como LoadingState e depois SucessState em caso de sucesso',
        () async {
      controller.createPerson(
        name: 'John Doe',
        cpf: '12345678900',
        date: '01/01/2000',
        phone: '123456789',
      );
      controller.setServico(ServiceEnum.encaminhamento);
      controller.setMotivo('Test Reason');
      controller.setDestinatario(RecipientEnum.ministerioPublico);

      await controller.encaminhar();

      expect(controller.state.value, isA<SucessState>());
    });

    test(
        'encaminhar deve definir o estado como ErrorState se a pessoa ou o serviço for nulo',
        () async {
      await controller.encaminhar();

      expect(controller.state.value, isA<ErrorState>());
      expect((controller.state.value as ErrorState).message,
          'Irregularidades no cadastro');
    });
  });
}
