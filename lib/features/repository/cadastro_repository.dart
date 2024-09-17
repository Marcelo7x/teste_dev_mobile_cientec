import 'package:teste_dev_mobile_cientec/features/models/destinatario_enum.dart';
import 'package:teste_dev_mobile_cientec/features/models/person_interface.dart';
import 'package:teste_dev_mobile_cientec/features/models/servico_enum.dart';

class CadastroRepository {
  Future<(bool sucess, String? error)> encaminhar(
      PersonInterface person,
      ServicoEnum servico,
      String motivo,
      DestinatarioEnum? destinatario) async {
        Future.delayed(const Duration(seconds: 2));
        return (true, null);
      }
}
