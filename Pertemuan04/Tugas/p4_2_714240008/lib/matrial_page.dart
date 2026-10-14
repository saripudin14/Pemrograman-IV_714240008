// material_page.dart
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCF8F9),
      appBar: AppBar(
        title: const Text(
          'Tugas Pertemuan 4',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Memosisikan semua box di tengah layar
          children: [
            // Box 1
            // Box 1
            Container(
              width: 260,
              height: 95,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(14),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.25), // Sudah diperbaiki
                    blurRadius: 10,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              alignment: Alignment.center,
              child: const Text(
                'Box 1',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 24),
            // Baris untuk Box 2 dan Box 3
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Box 2
                Container(
                  width: 120,
                  height: 155,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.red, width: 2.5),
                  ),
                  alignment: Alignment.topLeft, // Teks di pojok kiri atas
                  child: const Text(
                    'Box 2',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                // Box 3
                Container(
                  width: 120,
                  height: 155,
                  padding: const EdgeInsets.all(12),
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),     // Melengkung di kiri atas
                      bottomRight: Radius.circular(24), // Melengkung di kanan bawah
                    ),
                  ),
                  alignment: Alignment.bottomRight, // Teks di pojok kanan bawah
                  child: const Text(
                    'Box 3',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}