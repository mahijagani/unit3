import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;
  ThemeMode get themeMode => _themeMode;

  void toggleTheme() {
    _themeMode = _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class Hard7App extends StatelessWidget {
  const Hard7App({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            themeMode: themeProvider.themeMode,
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            home: const Hard7Screen(),
          );
        },
      ),
    );
  }
}

class Hard7Screen extends StatelessWidget {
  const Hard7Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hard 7: Theme Switcher')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Switch Theme Mode', style: TextStyle(fontSize: 20)),
            Switch(
              value: Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark,
              onChanged: (value) {
                Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
              },
            ),
          ],
        ),
      ),
    );
  }
}
