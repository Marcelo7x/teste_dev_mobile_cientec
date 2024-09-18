import 'dart:math';

import 'package:flutter/material.dart';
import 'package:teste_dev_mobile_cientec/features/models/servico_enum.dart';
import 'package:teste_dev_mobile_cientec/features/views/components/custom_appbar_component.dart';
import 'package:teste_dev_mobile_cientec/features/views/components/title_component.dart';
import 'package:teste_dev_mobile_cientec/features/views/pages/send_cadastro_page.dart';
import 'package:teste_dev_mobile_cientec/main.dart';
import 'package:teste_dev_mobile_cientec/res/app_dimens.dart';

class ServiceSelectPage extends StatefulWidget {
  const ServiceSelectPage({super.key});

  @override
  State<ServiceSelectPage> createState() => _ServiceSelectPageState();
}

class _ServiceSelectPageState extends State<ServiceSelectPage> {
  String service = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbarComponent(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: AppDimens.marginSmall),
            child: TitleComponent(title: 'Cadastro'),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(AppDimens.marginXLarge),
                        child: Text(
                          'Selecione o serviço',
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: AppDimens.marginXLarge),
                        child: Column(
                          children: ServicoEnum.values
                              .map((e) => RadioListTile(
                                    contentPadding: EdgeInsets.zero,
                                    title: Text(e.value,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium),
                                    value: e.value,
                                    groupValue: service,
                                    controlAffinity:
                                        ListTileControlAffinity.trailing,
                                    onChanged: (v) {
                                      setState(() {
                                        service = v as String;
                                      });
                                    },
                                  ))
                              .toList(),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 70,
                        margin: const EdgeInsets.only(
                            bottom: AppDimens.marginXLarge,
                            top: AppDimens.margin2XLarge),
                        width: min(MediaQuery.sizeOf(context).width * .7, 300),
                        child: FilledButton(
                            onPressed: () {
                              if (service.isEmpty) {
                                return;
                              } else {
                                CADASTRO_CONTROLLER
                                    .setServico(ServicoEnum.fromValue(service));
                              }
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      const SendCadastroPage()));
                            },
                            child: const Text('Continuar')),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
