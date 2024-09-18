import 'package:flutter/material.dart';
import 'package:teste_dev_mobile_cientec/features/controllers/registration_controller.dart';
import 'package:teste_dev_mobile_cientec/features/models/recipient_enum.dart';
import 'package:teste_dev_mobile_cientec/res/app_dimens.dart';

class SelectRecipientComponent extends StatefulWidget {
  SelectRecipientComponent({super.key, required this.controller});

  RegistrationController controller;

  @override
  State<SelectRecipientComponent> createState() =>
      _SelectRecipientComponentState();
}

class _SelectRecipientComponentState extends State<SelectRecipientComponent> {
  late RecipientEnum destinatarioSelected;

  @override
  void initState() {
    super.initState();
    destinatarioSelected =
        widget.controller.destinatario ?? RecipientEnum.defensoriaPublica;
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return SizedBox(
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: RecipientEnum.values
                .map(
                  (el) => Container(
                    width: width,
                    color: destinatarioSelected != el
                        ? Theme.of(context).colorScheme.surfaceContainerHigh
                        : Theme.of(context).colorScheme.surfaceContainer,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        backgroundColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          destinatarioSelected = el;
                        });
                      },
                      child: Text(
                        el.destinatario,
                        style:
                            Theme.of(context).textTheme.labelMedium!.copyWith(
                                  color: destinatarioSelected != el
                                      ? Theme.of(context)
                                          .colorScheme
                                          .onSurfaceVariant
                                      : Colors.black,
                                ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
          Container(
            height: 70,
            width: width * .7,
            margin: const EdgeInsets.symmetric(vertical: AppDimens.marginLarge),
            child: FilledButton(
              onPressed: () {
                widget.controller.setDestinatario(destinatarioSelected);
                Navigator.pop(context);
              },
              child: const Text('Salvar'),
            ),
          ),
        ],
      ),
    );
  }
}
