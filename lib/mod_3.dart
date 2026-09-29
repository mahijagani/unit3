import 'package:flutter/material.dart';

class Student {
  final String name;
  final String rollNo;
  final int marks;

  Student(this.name, this.rollNo, this.marks);
}

class Mod3HomeScreen extends StatelessWidget {
  const Mod3HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final student = Student('John Doe', 'A101', 85);

    return Scaffold(
      appBar: AppBar(title: const Text('Mod 3: Send Student Data')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Mod3DetailScreen(student: student)),
            );
          },
          child: const Text('View Student Details'),
        ),
      ),
    );
  }
}

class Mod3DetailScreen extends StatelessWidget {
  final Student student;
  const Mod3DetailScreen({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Student Details')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: ${student.name}', style: const TextStyle(fontSize: 20)),
            Text('Roll No: ${student.rollNo}', style: const TextStyle(fontSize: 20)),
            Text('Marks: ${student.marks}', style: const TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
