import 'package:flutter/material.dart';
import 'package:teste_dev_mobile_cientec/features/controllers/registration_controller.dart';
import 'package:teste_dev_mobile_cientec/features/views/pages/home_page.dart';
import 'package:teste_dev_mobile_cientec/res/themedata_light.dart';

RegistrationController REGISTRATION_CONTROLLER = RegistrationController();

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
