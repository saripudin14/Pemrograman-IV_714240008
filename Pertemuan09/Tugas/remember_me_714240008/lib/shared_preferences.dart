import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyShared extends StatefulWidget {
  const MyShared({super.key});

  @override
  State<MyShared> createState() => _MySharedState();
}

class _MySharedState extends State<MyShared> {
  final TextEditingController _inputController = TextEditingController();
  final TextEditingController _outputController = TextEditingController();

  late SharedPreferences prefs;

  // true jika Delete Value sudah ditekan sekali
  bool _deletedOnce = false;

  @override
  void initState() {
    super.initState();
    initial();
  }

  Future<void> initial() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  void dispose() {
    _inputController.dispose();
    _outputController.dispose();
    super.dispose();
  }

  Future<void> _saveValue() async {
    prefs = await SharedPreferences.getInstance();
    await prefs.setString('saved_value', _inputController.text);
    debugPrint('SAVED: ${_inputController.text}');
    _inputController.clear();
    _deletedOnce = false;
  }

  Future<void> _getValue() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      _outputController.text = prefs.getString('saved_value').toString();
    });
    debugPrint('GET: ${_outputController.text}');
  }

  Future<void> _deleteValue() async {
    prefs = await SharedPreferences.getInstance();
    await prefs.remove('saved_value');

    setState(() {
      if (!_deletedOnce) {
        _outputController.text = 'null';
        _deletedOnce = true;
      } else {
        _outputController.clear();
      }
    });
    debugPrint('DELETED');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shared Preferences"),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _inputController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            ElevatedButton(
              onPressed: _saveValue,
              child: const Text("Save"),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _outputController,
              readOnly: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _getValue,
              child: const Text("Get Value"),
            ),
            ElevatedButton(
              onPressed: _deleteValue,
              child: const Text("Delete Value"),
            ),
          ],
        ),
      ),
    );
  }
}