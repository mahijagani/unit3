import 'package:flutter/material.dart';

class Easy6Screen extends StatefulWidget {
  const Easy6Screen({super.key});

  @override
  State<Easy6Screen> createState() => _Easy6ScreenState();
}

class _Easy6ScreenState extends State<Easy6Screen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Easy 6: Simple Form')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Enter Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Field required';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing Data')),
                    );
                  }
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
