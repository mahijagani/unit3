import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class User {
  final String email;
  final String password;
  User(this.email, this.password);
}

class UserProvider extends ChangeNotifier {
  final List<User> _users = [
    User('user1@test.com', 'pass123'),
    User('user2@test.com', 'secret456'),
  ];

  bool validateUser(String email, String password) {
    return _users.any((u) => u.email == email && u.password == password);
  }
}

class Hard10Screen extends StatefulWidget {
  const Hard10Screen({super.key});

  @override
  State<Hard10Screen> createState() => _Hard10ScreenState();
}

class _Hard10ScreenState extends State<Hard10Screen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UserProvider(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Hard 10: Multi-user Login')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Builder(
            builder: (context) {
              return Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(labelText: 'Email (user1@test.com)'),
                      validator: (v) => v == null || v.isEmpty ? 'Required' : null,
                    ),
                    TextFormField(
                      controller: _passwordController,
                      decoration: const InputDecoration(labelText: 'Password (pass123)'),
                      obscureText: true,
                      validator: (v) => v == null || v.isEmpty ? 'Required' : null,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          final isValid = Provider.of<UserProvider>(context, listen: false)
                              .validateUser(_emailController.text, _passwordController.text);
                          
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(isValid ? 'Login Success!' : 'Invalid user')),
                          );
                        }
                      },
                      child: const Text('Login'),
                    ),
                  ],
                ),
              );
            }
          ),
        ),
      ),
    );
  }
}
