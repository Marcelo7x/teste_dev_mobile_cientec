import 'package:flutter/material.dart';
import 'package:teste_dev_mobile_cientec/features/controllers/registration_controller.dart';
import 'package:teste_dev_mobile_cientec/features/views/components/custom_appbar_component.dart';
import 'package:teste_dev_mobile_cientec/features/views/components/person_form_component.dart';
import 'package:teste_dev_mobile_cientec/features/views/components/title_component.dart';
import 'package:teste_dev_mobile_cientec/main.dart';
import 'package:teste_dev_mobile_cientec/res/app_dimens.dart';

class RegisterPersonPage extends StatefulWidget {
  const RegisterPersonPage({super.key});

  @override
  State<RegisterPersonPage> createState() => _RegisterPersonPageState();
}

class _RegisterPersonPageState extends State<RegisterPersonPage> {
  @override
  void initState() {
    super.initState();
    REGISTRATION_CONTROLLER = RegistrationController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbarComponent(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: AppDimens.marginSmall),
              child: TitleComponent(title: 'Cadastro'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppDimens.marginXLarge),
              child: PersonFormComponent(
                controller: REGISTRATION_CONTROLLER,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
