import 'package:flutter/material.dart';
import 'package:teste_dev_mobile_cientec/res/app_dimens.dart';

class TitleComponent extends StatelessWidget {
  const TitleComponent({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return Container(
      width: width,
      height: AppDimens.titleContainerHeight,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: AppDimens.marginLarge),
      color: Theme.of(context).colorScheme.primary,
      child: Text(
        title,
        style: Theme.of(context).textTheme.headlineMedium!.copyWith(
              color: Theme.of(context).colorScheme.onPrimary,
            ),
      ),
    );
  }
}
