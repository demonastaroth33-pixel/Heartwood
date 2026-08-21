import 'package:flutter/material.dart';

import 'core/theme.dart';
import 'widgets/nav_shell.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PersonalOS',
      theme: buildTheme(),
      home: const NavShell(),
    );
  }
}