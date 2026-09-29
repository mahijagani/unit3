import 'package:flutter/material.dart';

class UserData {
  String name = '';
  String gender = 'Male';
  bool acceptTerms = false;
}

class Hard6Screen extends StatefulWidget {
  const Hard6Screen({super.key});

  @override
  State<Hard6Screen> createState() => _Hard6ScreenState();
}

class _Hard6ScreenState extends State<Hard6Screen> {
  final _formKey = GlobalKey<FormState>();
  final _userData = UserData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hard 6: Complex Form')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Name'),
                validator: (v) => v == null || v.isEmpty ? 'Required' : null,
                onSaved: (v) => _userData.name = v ?? '',
              ),
              DropdownButtonFormField<String>(
                value: _userData.gender,
                items: ['Male', 'Female', 'Other'].map((g) => DropdownMenuItem(value: g, child: Text(g))).toList(),
                onChanged: (v) => setState(() => _userData.gender = v!),
                onSaved: (v) => _userData.gender = v!,
                decoration: const InputDecoration(labelText: 'Gender'),
              ),
              CheckboxListTile(
                title: const Text('Accept Terms'),
                value: _userData.acceptTerms,
                onChanged: (v) => setState(() => _userData.acceptTerms = v!),
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate() && _userData.acceptTerms) {
                    _formKey.currentState!.save();
                    Navigator.push(context, MaterialPageRoute(builder: (_) => SummaryScreen(data: _userData)));
                  } else if (!_userData.acceptTerms) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please accept terms')));
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

class SummaryScreen extends StatelessWidget {
  final UserData data;
  const SummaryScreen({super.key, required this.data});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Summary')),
      body: Center(child: Text('Name: ${data.name}\nGender: ${data.gender}', style: const TextStyle(fontSize: 20))),
    );
  }
}
