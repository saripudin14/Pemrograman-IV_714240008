import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Tempat Wisata Bandung',
      home: DetailScreen(),
    );
  }
}

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 16.0),
              child: const Text('Ranca Upas',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                Column(
                  children: const [
                    Icon(Icons.calendar_today),
                    SizedBox(height: 8.0),
                    Text('Open Everyday'),
                  ],
                ),
                Column(
                  children: const [
                    Icon(Icons.access_time),
                    SizedBox(height: 8.0),
                    Text('08:00 - 17:00'),
                  ],
                ),
                Column(
                  children: const [
                    Icon(Icons.monetization_on),
                    SizedBox(height: 8.0),
                    Text('Rp 10.000'),
                  ],
                ),
              ],),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: const Text(
                'Ranca Upas adalah sebuah tempat wisata alam yang terletak di Bandung, Jawa Barat. Tempat ini terkenal dengan keindahan alamnya, termasuk hutan pinus, danau, dan area camping. Pengunjung dapat menikmati berbagai aktivitas seperti berkemah, memancing, dan berjalan-jalan di sekitar danau.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}