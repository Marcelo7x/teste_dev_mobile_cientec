import 'package:flutter/material.dart';
import 'package:teste_dev_mobile_cientec/features/views/pages/home_page.dart';
import 'package:teste_dev_mobile_cientec/res/app_colors.dart';
import 'package:teste_dev_mobile_cientec/res/app_dimens.dart';
import 'package:teste_dev_mobile_cientec/res/themedata_light.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Teste Dev Mobile',
      theme: themeData,
      routes: {
        '/': (context) => const HomePage(),
      },
    );
  }
}
