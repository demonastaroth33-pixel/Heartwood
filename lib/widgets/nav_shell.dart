import 'package:flutter/material.dart';

import '../core/theme/tokens.dart';
import '../features/dashboard/dashboard_screen.dart';
import '../features/habits/habits_screen.dart';
import '../features/journal/journal_screen.dart';
import '../features/settings/settings_screen.dart';
import 'atmosphere_layer.dart';

class NavShell extends StatefulWidget {
  const NavShell({super.key});

  @override
  State<NavShell> createState() => _NavShellState();
}

class _NavShellState extends State<NavShell> {
  int _index = 0;

  static const _destinations = <NavigationDestination>[
    NavigationDestination(
      icon: Icon(Icons.space_dashboard_outlined),
      selectedIcon: Icon(Icons.space_dashboard),
      label: 'Dashboard',
    ),
    NavigationDestination(
      icon: Icon(Icons.book_outlined),
      selectedIcon: Icon(Icons.book),
      label: 'Journal',
    ),
    NavigationDestination(
      icon: Icon(Icons.check_circle_outline),
      selectedIcon: Icon(Icons.check_circle),
      label: 'Habits',
    ),
    NavigationDestination(
      icon: Icon(Icons.settings_outlined),
      selectedIcon: Icon(Icons.settings),
      label: 'Settings',
    ),
  ];

  static const _screens = <Widget>[
    DashboardScreen(),
    JournalScreen(),
    HabitsScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final body = IndexedStack(index: _index, children: _screens);
    return LayoutBuilder(
      builder: (context, constraints) {
        final desktop = constraints.maxWidth >= 800;
        return Stack(
          children: [
            const Positioned.fill(child: AtmosphereLayer()),
            if (desktop)
              Scaffold(
                backgroundColor: Colors.transparent,
                body: Row(
                  children: [
                    NavigationRail(
                      selectedIndex: _index,
                      onDestinationSelected: (i) => setState(() => _index = i),
                      labelType: NavigationRailLabelType.all,
                      minWidth: 80,
                      destinations: _destinations
                          .map(
                            (d) => NavigationRailDestination(
                              icon: d.icon,
                              selectedIcon: d.selectedIcon,
                              label: Text(d.label),
                            ),
                          )
                          .toList(),
                    ),
                    VerticalDivider(
                      width: 1,
                      thickness: 1,
                      color: Theme.of(context).extension<AppTokens>()!.hairline,
                    ),
                    Expanded(child: body),
                  ],
                ),
              )
            else
              Scaffold(
                backgroundColor: Colors.transparent,
                body: body,
                bottomNavigationBar: NavigationBar(
                  selectedIndex: _index,
                  onDestinationSelected: (i) => setState(() => _index = i),
                  destinations: _destinations,
                ),
              ),
          ],
        );
      },
    );
  }
}