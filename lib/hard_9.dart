import 'package:flutter/material.dart';

class Hard9Screen extends StatefulWidget {
  const Hard9Screen({super.key});

  @override
  State<Hard9Screen> createState() => _Hard9ScreenState();
}

class _Hard9ScreenState extends State<Hard9Screen> {
  int _currentIndex = 0;

  final List<GlobalKey<NavigatorState>> _navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [
          _buildNavigator(0),
          _buildNavigator(1),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          if (_currentIndex == index) {
            _navigatorKeys[index].currentState!.popUntil((route) => route.isFirst);
          } else {
            setState(() => _currentIndex = index);
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }

  Widget _buildNavigator(int index) {
    return Navigator(
      key: _navigatorKeys[index],
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => index == 0 ? const Tab1Home() : const Tab2Home(),
        );
      },
    );
  }
}

class Tab1Home extends StatelessWidget {
  const Tab1Home({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tab 1 Home')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const Tab1Detail())),
          child: const Text('Go to Detail'),
        ),
      ),
    );
  }
}

class Tab1Detail extends StatelessWidget {
  const Tab1Detail({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('Tab 1 Detail')), body: const Center(child: Text('Nested Detail Screen')));
  }
}

class Tab2Home extends StatelessWidget {
  const Tab2Home({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('Tab 2 Home')), body: const Center(child: Text('Settings Screen')));
  }
}
