import 'package:flutter/foundation.dart';
import 'package:teste_dev_mobile_cientec/features/core/app_state.dart';
import 'package:teste_dev_mobile_cientec/features/models/recipient_enum.dart';
import 'package:teste_dev_mobile_cientec/features/models/person_impl.dart';
import 'package:teste_dev_mobile_cientec/features/models/person_interface.dart';
import 'package:teste_dev_mobile_cientec/features/models/service_enum.dart';
import 'package:teste_dev_mobile_cientec/features/repository/cadastro_repository.dart';

class RegistrationController {
  final state = ValueNotifier<AppState>(ReadyState());
  final _repository = CadastroRepository();
  PersonInterface? _person;
  PersonInterface? get person => _person;
  ServiceEnum? _servico;
  ServiceEnum? get servico => _servico;
  String motivo = '';
  RecipientEnum? _destinatario;
  RecipientEnum? get destinatario => _destinatario;

  RegistrationController();

  void createPerson(
      {required String name,
      required String cpf,
      required String date,
      required String phone}) {
    _person = PersonImpl(name: name, cpf: cpf, date: date, phone: phone);
  }

  void setServico(ServiceEnum servico) {
    _servico = servico;
  }

  void setMotivo(String motivo) {
    this.motivo = motivo;
  }

  void setDestinatario(RecipientEnum destinatario) {
    _destinatario = destinatario;
  }

  Future<void> encaminhar() async {
    if (_person != null && _servico != null) {
      state.value = LoadingState();

      if (motivo.isEmpty) {
        state.value = ErrorState('Motivo não informado');
        return;
      } else if (destinatario == null) {
        state.value = ErrorState('Deve ser informado a quem encaminhar');
        return;
      } else if (servico == null) {
        state.value = ErrorState('Serviço não informado');
        return;
      } else if (person == null) {
        state.value = ErrorState('Pessoa não informada');
        return;
      }

      print('Encaminhando: $_person, $_servico, $motivo, $_destinatario');

      final (sucess, error) = await _repository.encaminhar(
          _person!, _servico!, motivo, _destinatario);

      if (sucess) {
        state.value = SucessState();
      } else {
        state.value = ErrorState(error!);
      }
    } else {
      state.value = ErrorState('Irregularidades no cadastro');
    }
  }
}
