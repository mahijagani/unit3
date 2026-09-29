import 'package:flutter/material.dart';

class Hard1Screen extends StatefulWidget {
  const Hard1Screen({super.key});

  @override
  State<Hard1Screen> createState() => _Hard1ScreenState();
}

class _Hard1ScreenState extends State<Hard1Screen> {
  int _currentStep = 0;
  final _formKeys = [GlobalKey<FormState>(), GlobalKey<FormState>(), GlobalKey<FormState>()];
  
  String _name = '';
  String _address = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hard 1: Multi-step Wizard')),
      body: Stepper(
        currentStep: _currentStep,
        onStepContinue: () {
          if (_formKeys[_currentStep].currentState!.validate()) {
            if (_currentStep < 2) {
              setState(() => _currentStep++);
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Form Submitted Successfully!')),
              );
            }
          }
        },
        onStepCancel: () {
          if (_currentStep > 0) {
            setState(() => _currentStep--);
          }
        },
        steps: [
          Step(
            title: const Text('Personal Info'),
            isActive: _currentStep >= 0,
            content: Form(
              key: _formKeys[0],
              child: TextFormField(
                decoration: const InputDecoration(labelText: 'Full Name'),
                validator: (v) => v == null || v.isEmpty ? 'Name required' : null,
                onChanged: (v) => _name = v,
              ),
            ),
          ),
          Step(
            title: const Text('Address'),
            isActive: _currentStep >= 1,
            content: Form(
              key: _formKeys[1],
              child: TextFormField(
                decoration: const InputDecoration(labelText: 'Address'),
                validator: (v) => v == null || v.isEmpty ? 'Address required' : null,
                onChanged: (v) => _address = v,
              ),
            ),
          ),
          Step(
            title: const Text('Review'),
            isActive: _currentStep >= 2,
            content: Form(
              key: _formKeys[2],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Name: $_name', style: const TextStyle(fontSize: 16)),
                  Text('Address: $_address', style: const TextStyle(fontSize: 16)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
