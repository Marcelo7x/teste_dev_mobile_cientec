import 'package:flutter/material.dart';
import 'package:teste_dev_mobile_cientec/features/controllers/home_controller.dart';
import 'package:teste_dev_mobile_cientec/features/views/components/custom_appbar_component.dart';
import 'package:teste_dev_mobile_cientec/features/views/pages/cadastro_person_page.dart';
import 'package:teste_dev_mobile_cientec/res/app_dimens.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _homeController = HomeController();

  final bottomNavigationBarItems = <BottomNavigationBarItem>[
    const BottomNavigationBarItem(
      icon: Icon(Icons.person_outline),
      label: 'Perfil',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.home_outlined),
      label: 'Início',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.menu_rounded),
      label: 'Menu',
    ),
  ];

  final pages = [
    // const ProfilePage(),
    // const HomePage(),
    // const MenuPage(),
    const CadastroPersonPage(),
  ];

  @override
  void dispose() {
    super.dispose();
    _homeController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height -
        (MediaQuery.of(context).padding.top +
            AppDimens.appBarHeight +
            AppDimens.bottomNavigationBarHeight);
    return Scaffold(
      body: Navigator(
        onGenerateRoute: (settings) => MaterialPageRoute(
          builder: (context) => SizedBox(
            height: height,
            child: ValueListenableBuilder(
              valueListenable: _homeController.currentPage,
              builder: (context, int pageIndex, child) => pages[pageIndex],
            ),
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: AppDimens.bottomNavigationBarHeight,
        child: BottomNavigationBar(
          items: bottomNavigationBarItems,
          iconSize: AppDimens.iconLarge,
          selectedIconTheme: IconThemeData(
            /// cor para indicar que está desabilitado
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
          selectedLabelStyle: TextStyle(
            /// cor para indicar que está desabilitado
            color: Theme.of(context).colorScheme.onSurfaceVariant,
            fontSize: AppDimens.textXSmall,
          ),
        ),
      ),
    );
  }
}
