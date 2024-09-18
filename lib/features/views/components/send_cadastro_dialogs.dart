import 'package:flutter/material.dart';
import 'package:teste_dev_mobile_cientec/features/core/app_state.dart';
import 'package:teste_dev_mobile_cientec/main.dart';
import 'package:teste_dev_mobile_cientec/res/app_dimens.dart';

sucessDialog(context) => showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
          content: Text(
            'Encaminhamento realizado com sucesso!',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.labelLarge,
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            SizedBox(
              height: 70,
              child: FilledButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamedAndRemoveUntil('/', (route) => false);
                  },
                  child: const Text('Voltar para cadastro')),
            ),
          ],
        );
      });

  errorDialog(context) => showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
          content: Text(
            'Erro ao encaminhar: ${(CADASTRO_CONTROLLER.state.value as ErrorState).message}',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.labelLarge,
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            SizedBox(
              height: 70,
              child: FilledButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Fechar')),
            ),
          ],
        );
      });

  confimationDialog(context) => showDialog(
      context: context,
      builder: (BuildContext context) {
        final width = MediaQuery.sizeOf(context).width;
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
          content: Text(
            'Deseja confirmar o encaminhamento?',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.labelLarge,
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 70,
                  width: width * .3,
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Cancelar',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary),
                    ),
                  ),
                ),
                const SizedBox(
                  width: AppDimens.marginLarge,
                ),
                SizedBox(
                  height: 70,
                  width: width * .3,
                  child: FilledButton(
                      onPressed: () {
                        Navigator.pop(context);
                        CADASTRO_CONTROLLER.encaminhar();
                      },
                      child: const Text('Confirmar')),
                ),
              ],
            ),
          ],
        );
      });