import 'package:flutter/material.dart';

class Moderate6LoginScreen extends StatefulWidget {
  const Moderate6LoginScreen({super.key});

  @override
  State<Moderate6LoginScreen> createState() => _Moderate6LoginScreenState();
}

class _Moderate6LoginScreenState extends State<Moderate6LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String? _errorMessage;

  void _login() {
    if (_emailController.text == 'admin@gmail.com' && _passwordController.text == '123456') {
      setState(() => _errorMessage = null);
      Navigator.push(context, MaterialPageRoute(builder: (_) => const Mod6HomeScreen()));
    } else {
      setState(() => _errorMessage = 'Invalid Credentials');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mod 6: Login Form')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: _emailController, decoration: const InputDecoration(labelText: 'Email (admin@gmail.com)')),
            TextField(controller: _passwordController, decoration: const InputDecoration(labelText: 'Password (123456)'), obscureText: true),
            if (_errorMessage != null) Text(_errorMessage!, style: const TextStyle(color: Colors.red)),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: _login, child: const Text('Login')),
          ],
        ),
      ),
    );
  }
}

class Mod6HomeScreen extends StatelessWidget {
  const Mod6HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('Home Screen')), body: const Center(child: Text('Welcome!')));
  }
}
