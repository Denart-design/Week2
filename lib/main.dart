import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Grade Calculator',
      home: const GradeCalculatorPage(),
    );
  }
}

class GradeCalculatorPage extends StatefulWidget {
  const GradeCalculatorPage({super.key});

  @override
  State<GradeCalculatorPage> createState() => _GradeCalculatorPageState();
}

class _GradeCalculatorPageState extends State<GradeCalculatorPage> {
  final TextEditingController grade1Controller = TextEditingController();
  final TextEditingController grade2Controller = TextEditingController();
  final TextEditingController grade3Controller = TextEditingController();

  String result = '';
  String status = '';

  void calculateAverage() {
    if (grade1Controller.text.isEmpty ||
        grade2Controller.text.isEmpty ||
        grade3Controller.text.isEmpty) {
      setState(() {
        result = 'Please fill all fields';
        status = '';
      });
      return;
    }

    double grade1 = double.tryParse(grade1Controller.text) ?? 0;
    double grade2 = double.tryParse(grade2Controller.text) ?? 0;
    double grade3 = double.tryParse(grade3Controller.text) ?? 0;

    double average = (grade1 + grade2 + grade3) / 3;

    setState(() {
      result = average.toStringAsFixed(2);

      if (average >= 50) {
        status = 'Kalon';
      } else {
        status = 'Duhet permiresim';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grade Calculator'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: grade1Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Grade 1',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: grade2Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Grade 2',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: grade3Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Grade 3',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: calculateAverage,
              child: const Text('Calculate'),
            ),
            const SizedBox(height: 20),
            Text(
              'Average: $result',
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              status,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
