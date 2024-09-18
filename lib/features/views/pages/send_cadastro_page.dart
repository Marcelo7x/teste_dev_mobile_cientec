import 'package:flutter/material.dart';
import 'package:teste_dev_mobile_cientec/features/core/app_state.dart';
import 'package:teste_dev_mobile_cientec/features/models/destinatario_enum.dart';
import 'package:teste_dev_mobile_cientec/features/views/components/custom_appbar_component.dart';
import 'package:teste_dev_mobile_cientec/features/views/components/motivo_modal_component.dart';
import 'package:teste_dev_mobile_cientec/features/views/components/person_info_component.dart';
import 'package:teste_dev_mobile_cientec/features/views/components/select_destinatario_component.dart';
import 'package:teste_dev_mobile_cientec/features/views/components/send_cadastro_dialogs.dart';
import 'package:teste_dev_mobile_cientec/features/views/components/title_component.dart';
import 'package:teste_dev_mobile_cientec/main.dart';
import 'package:teste_dev_mobile_cientec/res/app_dimens.dart';

class SendCadastroPage extends StatefulWidget {
  const SendCadastroPage({super.key});

  @override
  State<SendCadastroPage> createState() => _SendCadastroPageState();
}

class _SendCadastroPageState extends State<SendCadastroPage> {
  DestinatarioEnum? destinatarioSelected;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    CADASTRO_CONTROLLER.state.addListener(() {
      if (CADASTRO_CONTROLLER.state.value is SucessState) {
        sucessDialog(_scaffoldKey.currentState!.context);
      }
      if (CADASTRO_CONTROLLER.state.value is ErrorState) {
        errorDialog(_scaffoldKey.currentState!.context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;

    return Scaffold(
      key: _scaffoldKey,
      appBar: customAppbarComponent(),
      body: ValueListenableBuilder(
        valueListenable: CADASTRO_CONTROLLER.state,
        builder: (context, state, child) {
          return switch (state) {
            (LoadingState _) => const Center(
                child: SizedBox(
                  height: 35,
                  width: 35,
                  child: CircularProgressIndicator(),
                ),
              ),
            _ => Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: AppDimens.marginSmall),
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
                                padding: const EdgeInsets.symmetric(
                                    horizontal: AppDimens.marginXLarge,
                                    vertical: AppDimens.marginXLarge),
                                child: PersonInfoComponent(
                                    person: CADASTRO_CONTROLLER.person!),
                              ),
                              const SizedBox(
                                height: AppDimens.marginLarge,
                              ),
                              TextButton(
                                onPressed: () {
                                  showModalBottomSheet(
                                    context: context,
                                    backgroundColor: Theme.of(context)
                                        .colorScheme
                                        .surfaceBright,
                                    showDragHandle: true,
                                    builder: (BuildContext context) {
                                      return SelectDestinatarioComponent(
                                        controller: CADASTRO_CONTROLLER,
                                      );
                                    },
                                  );
                                },
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  backgroundColor: Theme.of(context)
                                      .colorScheme
                                      .surfaceBright,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(0),
                                  ),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: AppDimens.marginXLarge),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Encaminhar para'),
                                      Icon(Icons.arrow_forward_ios_rounded),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: AppDimens.marginLarge,
                              ),
                              TextButton(
                                onPressed: () {
                                  showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    backgroundColor: Theme.of(context)
                                        .colorScheme
                                        .surfaceBright,
                                    builder: (BuildContext context) {
                                      return SizedBox(
                                          height: height * .9,
                                          child: MotivoModalComponent(
                                            controller: CADASTRO_CONTROLLER,
                                          ));
                                    },
                                  );
                                },
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  backgroundColor: Theme.of(context)
                                      .colorScheme
                                      .surfaceBright,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(0),
                                  ),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: AppDimens.marginXLarge),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Motivo'),
                                      Icon(Icons.arrow_forward_ios_rounded),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: AppDimens.margin2XLarge,
                              bottom: AppDimens.marginXLarge,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 70,
                                  width: width * .4,
                                  child: OutlinedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      'Cancelar',
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: AppDimens.marginLarge,
                                ),
                                SizedBox(
                                  height: 70,
                                  width: width * .4,
                                  child: FilledButton(
                                    onPressed: () {
                                      confimationDialog(context);
                                    },
                                    child: const Text('Salvar'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
          };
        },
      ),
    );
  }
}
