import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Row(
          children: [
            Icon(Icons.widgets),
            SizedBox(width: 8),
            Text('Home Page'),
          ],
        ),
      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.flutter_dash,
                    color: Colors.white,
                    size: 45,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Menu Praktikum',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            ListTile(
              leading: const Icon(
                Icons.home,
                color: Colors.blue,
              ),
              title: const Text('Home Page'),
              onTap: () {
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: const Icon(
                Icons.info,
                color: Colors.blue,
              ),
              title: const Text('About Page'),
              onTap: () {
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: const Icon(
                Icons.settings,
                color: Colors.blue,
              ),
              title: const Text('Settings'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),

      body: const Center(
        child: BiggerText(
          teks: "Hello ULBI",
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.yellow,
        unselectedItemColor: Colors.white70,
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}


// ================================
// STATELESS WIDGET HEADING
// ================================

class Heading extends StatelessWidget {
  final String text;

  const Heading({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 28.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}


// ================================
// STATEFUL WIDGET BIGGER TEXT
// ================================

class BiggerText extends StatefulWidget {
  final String teks;

  const BiggerText({
    super.key,
    required this.teks,
  });

  @override
  State<BiggerText> createState() => _BiggerTextState();
}


// ================================
// STATE BIGGER TEXT
// ================================

class _BiggerTextState extends State<BiggerText> {
  double _textSize = 16.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        // Teks Hello ULBI
        Text(
          widget.teks,
          style: TextStyle(
            fontSize: _textSize,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 20),

        // Tombol Perbesar / Perkecil
        ElevatedButton.icon(
          onPressed: () {
            setState(() {
              _textSize =
                  _textSize == 16.0
                      ? 32.0
                      : 16.0;
            });
          },

          // Ikon juga berubah
          icon: Icon(
            _textSize == 16.0
                ? Icons.zoom_in
                : Icons.zoom_out,
          ),

          // Teks tombol berubah
          label: Text(
            _textSize == 16.0
                ? "Perbesar"
                : "Perkecil",
          ),

          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 12,
            ),
          ),
        ),
      ],
    );
  }
}