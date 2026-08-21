import 'package:flutter/material.dart';

import 'core/theme.dart';
import 'features/settings/recovery_screen.dart';
import 'widgets/nav_shell.dart';

class App extends StatelessWidget {
  final bool bootHealthy;

  const App({super.key, this.bootHealthy = true});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PersonalOS',
      theme: buildTheme(),
      home: bootHealthy ? const NavShell() : const RecoveryScreen(),
    );
  }
}