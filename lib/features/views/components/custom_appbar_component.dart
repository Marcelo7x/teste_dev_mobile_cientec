import 'package:flutter/material.dart';

PreferredSizeWidget customAppbarComponent() => AppBar(
      /// Nao deve conter nenhuma acao, entao nao usarei o endDrawer
      actions: [
        IconButton(
          icon: const Icon(Icons.menu_rounded),
          onPressed: () {},
        ),
      ],
    );
