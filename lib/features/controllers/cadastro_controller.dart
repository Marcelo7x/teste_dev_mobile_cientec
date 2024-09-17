import 'package:flutter/foundation.dart';
import 'package:teste_dev_mobile_cientec/features/core/app_state.dart';
import 'package:teste_dev_mobile_cientec/features/models/destinatario_enum.dart';
import 'package:teste_dev_mobile_cientec/features/models/person_impl.dart';
import 'package:teste_dev_mobile_cientec/features/models/person_interface.dart';
import 'package:teste_dev_mobile_cientec/features/models/servico_enum.dart';
import 'package:teste_dev_mobile_cientec/features/repository/cadastro_repository.dart';

class CadastroController {
  final state = ValueNotifier<AppState>(ReadyState());
  final CadastroRepository _repository;
  PersonInterface? _person;
  PersonInterface? get person => _person;
  ServicoEnum? _servico;
  ServicoEnum? get servico => _servico;
  String motivo = '';
  DestinatarioEnum? _destinatario;
  DestinatarioEnum? get destinatario => _destinatario;

  CadastroController(this._repository);

  void createPerson(
      {required String name,
      required String cpf,
      required String date,
      required String phone}) {
    _person = PersonImpl(name: name, cpf: cpf, date: date, phone: phone);
  }

  void setServico(ServicoEnum servico) {
    _servico = servico;
  }

  void setMotivo(String motivo) {
    this.motivo = motivo;
  }

  void setDestinatario(DestinatarioEnum destinatario) {
    _destinatario = destinatario;
  }	

  Future<void> encaminhar() async {
    if (_person != null && _servico != null) {
      state.value = LoadingState();
      final (sucess, error) = await _repository.encaminhar(_person!, _servico!, motivo, _destinatario);
      
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
