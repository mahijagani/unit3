import 'package:flutter/material.dart';

class Moderate5Screen extends StatefulWidget {
  const Moderate5Screen({super.key});

  @override
  State<Moderate5Screen> createState() => _Moderate5ScreenState();
}

class _Moderate5ScreenState extends State<Moderate5Screen> {
  final _formKey = GlobalKey<FormState>();
  final _emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mod 5: Registration Form')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Name'),
                validator: (v) => v == null || v.isEmpty ? 'Enter name' : null,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (v) {
                  if (v == null || v.isEmpty) return 'Enter email';
                  if (!_emailRegex.hasMatch(v)) return 'Enter valid email format';
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (v) {
                  if (v == null || v.isEmpty) return 'Enter password';
                  if (v.length < 6) return 'Password must be at least 6 characters';
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Registration Successful')),
                    );
                  }
                },
                child: const Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
