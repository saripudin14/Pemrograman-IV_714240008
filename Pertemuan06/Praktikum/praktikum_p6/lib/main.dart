import 'package:flutter/material.dart';
import 'bottom_navbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: false,
      ),
      home: const DynamicBottomNavbar(),
    );
  }
}

class MyInput extends StatefulWidget {
  const MyInput({super.key});

  @override
  State<MyInput> createState() => _MyInputState();
}

class _MyInputState extends State<MyInput> {
  final TextEditingController _controller = TextEditingController();
  bool nyala = false;
  String? language;
  bool paham = false;

  void showSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Kamu memilih: $language'),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Input Widget'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                hintText: 'Write your name here...',
                labelText: 'Your Name',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text('Submit'),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: Text('Hello, ${_controller.text}'),
                    );
                  },
                );
              },
            ),
            Switch(
              value: nyala,
              onChanged: (bool value) {
                setState(() {
                  nyala = value;
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(nyala ? 'Nyala' : 'Mati'),
                    duration: const Duration(seconds: 1),
                  ),
                );
              },
            ),
            RadioGroup<String>(
              groupValue: language,
              onChanged: (String? value) {
                setState(() {
                  language = value;
                });
                showSnackbar();
              },
              child: const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  RadioListTile<String>(
                    title: Text('Anies'),
                    value: 'Anies',
                  ),
                  RadioListTile<String>(
                    title: Text('Prabowo'),
                    value: 'Prabowo',
                  ),
                  RadioListTile<String>(
                    title: Text('Ganjar'),
                    value: 'Ganjar',
                  ),
                ],
              ),
            ),
            CheckboxListTile(
              title: const Text('Paham / Tidak Paham'),
              value: paham,
              onChanged: (bool? value) {
                setState(() {
                  paham = value!;
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(paham ? 'Paham' : 'Tidak Paham'),
                    duration: const Duration(seconds: 1),
                  ),
                );
              },
              controlAffinity: ListTileControlAffinity.leading,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}