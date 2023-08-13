import 'package:flutter/material.dart';
import 'package:flutter_meal_app/screens/tabs_screen/tabs_screen.dart';

import 'core/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: const TabsScreen(),
    );
  }
}
