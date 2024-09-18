import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:teste_dev_mobile_cientec/features/controllers/cadastro_controller.dart';
import 'package:teste_dev_mobile_cientec/features/core/input_formatter.dart';
import 'package:teste_dev_mobile_cientec/features/core/validator.dart';
import 'package:teste_dev_mobile_cientec/features/views/pages/service_select_page.dart';
import 'package:teste_dev_mobile_cientec/res/app_dimens.dart';

class PersonFormComponent extends StatelessWidget {
  PersonFormComponent({super.key, required this.controller});

  final _personFormKey = GlobalKey<FormState>();
  final CadastroController controller;
  String name = '';
  String cpf = '';
  String date = '';
  String phone = '';

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    return Form(
      key: _personFormKey,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Nome Completo',
                    hintText: 'Ex. Maria da Silva',
                  ),
                  keyboardType: TextInputType.name,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                        RegExp(r'[a-zA-Z\s\u00C0-\u00FF]')),
                  ],
                  validator: Validator().name().maxLength(40).validate(),
                  onSaved: (newValue) => name = newValue!,
                ),
                const SizedBox(
                  height: AppDimens.marginXLarge,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'CPF',
                    hintText: '000.000.000-00 ',
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(11),
                    InputFormatter.cpfFormatter(),
                  ],
                  validator: Validator().cpf().maxLength(14).validate(),
                  onSaved: (newValue) => cpf = newValue!,
                ),
                const SizedBox(
                  height: AppDimens.marginXLarge,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Data de nascimento',
                    hintText: '00/00/0000',
                  ),
                  keyboardType: TextInputType.datetime,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(8),
                    InputFormatter.dateFormatter(),
                  ],
                  validator:
                      Validator(optional: true).date().maxLength(10).validate(),
                  onSaved: (newValue) => date = newValue!,
                ),
                const SizedBox(
                  height: AppDimens.marginXLarge,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Telefone celular',
                    hintText: '(99) 99999-9999',
                  ),
                  keyboardType: TextInputType.phone,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(11),
                    InputFormatter.phoneFormatter(),
                  ],
                  validator: Validator().phone().maxLength(15).validate(),
                  onSaved: (newValue) => phone = newValue!,
                ),
              ],
            ),
            Container(
              height: 70,
              width: min(width * .7, 300),
              margin: const EdgeInsets.only(
                  top: AppDimens.margin2XLarge * 2,
                  bottom: AppDimens.marginXLarge),
              child: FilledButton(
                onPressed: () {
                  if (_personFormKey.currentState?.validate() ?? false) {
                    _personFormKey.currentState?.save();
                    controller.createPerson(
                        name: name, cpf: cpf, date: date, phone: phone);
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ServiceSelectPage(),
                    ));
                  }
                },
                child: const Text('Cadastrar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
