import 'package:flutter/material.dart';
import 'package:teste_dev_mobile_cientec/features/controllers/cadastro_controller.dart';
import 'package:teste_dev_mobile_cientec/features/views/components/custom_appbar_component.dart';
import 'package:teste_dev_mobile_cientec/features/views/components/person_form_component.dart';
import 'package:teste_dev_mobile_cientec/features/views/components/title_component.dart';
import 'package:teste_dev_mobile_cientec/main.dart';
import 'package:teste_dev_mobile_cientec/res/app_dimens.dart';

class CadastroPersonPage extends StatefulWidget {
  const CadastroPersonPage({super.key});

  @override
  State<CadastroPersonPage> createState() => _CadastroPersonPageState();
}

class _CadastroPersonPageState extends State<CadastroPersonPage> {
  @override
  void initState() {
    super.initState();
    CADASTRO_CONTROLLER = CadastroController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbarComponent(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: AppDimens.marginSmall),
            child: TitleComponent(title: 'Cadastro'),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppDimens.marginXLarge),
              child: PersonFormComponent(
                controller: CADASTRO_CONTROLLER,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
