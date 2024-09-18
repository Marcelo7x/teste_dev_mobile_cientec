import 'package:flutter/material.dart';
import 'package:teste_dev_mobile_cientec/features/models/person_interface.dart';
import 'package:teste_dev_mobile_cientec/res/app_dimens.dart';

class PersonInfoComponent extends StatefulWidget {
  const PersonInfoComponent({super.key, required this.person});

  final PersonInterface person;

  @override
  State<PersonInfoComponent> createState() => _PersonInfoComponentState();
}

class _PersonInfoComponentState extends State<PersonInfoComponent> {
  late final int age;

  @override
  void initState() {
    super.initState();
    if (widget.person.date.isNotEmpty) {
      age = (DateTime.now()
                  .difference(DateTime.parse(
                      widget.person.date.split('/').reversed.join('-')))
                  .inDays /
              365)
          .truncate();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.person.name),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                  text: 'CPF: ', style: Theme.of(context).textTheme.bodyMedium),
              TextSpan(
                text: widget.person.cpf,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
              ),
            ],
          ),
        ),
        if (widget.person.date.isNotEmpty)
          Wrap(
            spacing: AppDimens.marginMedium,
            alignment: WrapAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                        text: 'Data de nascimento: ',
                        style: Theme.of(context).textTheme.bodyMedium),
                    TextSpan(
                      text: widget.person.date,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color:
                                Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                    ),
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                        text: 'Idade: ',
                        style: Theme.of(context).textTheme.bodyMedium),
                    TextSpan(
                      text: age.toString(),
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color:
                                Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                    ),
                    TextSpan(
                      text: ' anos',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color:
                                Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                    ),
                  ],
                ),
              ),
            ],
          )
      ],
    );
  }
}
