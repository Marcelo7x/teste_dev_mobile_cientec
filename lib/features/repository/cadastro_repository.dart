import 'package:teste_dev_mobile_cientec/features/models/recipient_enum.dart';
import 'package:teste_dev_mobile_cientec/features/models/person_interface.dart';
import 'package:teste_dev_mobile_cientec/features/models/service_enum.dart';

class CadastroRepository {
  Future<(bool sucess, String? error)> encaminhar(PersonInterface person,
      ServiceEnum servico, String motivo, RecipientEnum? destinatario) async {
    await Future.delayed(const Duration(seconds: 2));
    return (true, null);
  }
}
