import 'package:flutter/material.dart';
import 'package:teste_dev_mobile_cientec/features/controllers/registration_controller.dart';
import 'package:teste_dev_mobile_cientec/res/app_dimens.dart';

class MotivoModalComponent extends StatefulWidget {
  const MotivoModalComponent({super.key, required this.controller});

  final RegistrationController controller;

  @override
  State<MotivoModalComponent> createState() => _MotivoModalComponentState();
}

class _MotivoModalComponentState extends State<MotivoModalComponent> {
  final motivo = TextEditingController();

  @override
  void initState() {
    super.initState();
    motivo.text = widget.controller.motivo;
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    return SizedBox(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(AppDimens.marginMedium),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Cancelar',
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                          decoration: TextDecoration.underline,
                        ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    widget.controller.setMotivo(motivo.text);
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Salvar',
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                          decoration: TextDecoration.underline,
                        ),
                  ),
                ),
              ],
            ),
          ),
          Divider(
            height: 3,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
          Padding(
            padding: const EdgeInsets.all(AppDimens.marginLarge),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Motivo',
                    style: Theme.of(context).textTheme.headlineLarge),
                const SizedBox(
                  height: AppDimens.marginMedium,
                ),
                SingleChildScrollView(
                  child: TextField(
                    controller: motivo,
                    maxLines: height ~/
                        (Theme.of(context).textTheme.bodyLarge!.fontSize! * 2),
                    minLines: 10,
                    keyboardType: TextInputType.multiline,
                    decoration: const InputDecoration(
                      hintText: 'Digite o motivo',
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
