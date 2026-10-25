import 'package:flutter/material.dart';
import 'detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String namaMahasiswa = 'Muhammad Arif Rivaldi';
  static const String npmMahasiswa = '714240008';
  static const Color primaryColor = Color(0xFF3F5728);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tugas 5'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 400,
            ),
            child: Card(
              elevation: 6,
              color: Colors.white,
              shadowColor: Colors.black26,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              child: Padding(
                padding: const EdgeInsets.all(25),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(75),
                      child: Image.asset(
                        'images/SSB.jpg',
                        width: 150,
                        height: 150,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            width: 150,
                            height: 150,
                            color: Colors.grey.shade200,
                            child: const Icon(
                              Icons.person,
                              size: 80,
                              color: primaryColor,
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 22),

                    const Text(
                      namaMahasiswa,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Oasis',
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: primaryColor,
                      ),
                    ),
                    const SizedBox(height: 8),

                    const Text(
                      npmMahasiswa,
                      style: TextStyle(
                        fontFamily: 'HelveticaBlack',
                        fontSize: 18,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(height: 15),

                    const Divider(),
                    const SizedBox(height: 15),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute<void>(
                              builder: (context) => const DetailScreen(
                                nama: namaMahasiswa,
                                npm: npmMahasiswa,
                              ),
                            ),
                          );
                        },
                        icon: const Icon(Icons.arrow_forward),
                        label: const Text('Lihat Detail Profil'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            vertical: 15,
                            horizontal: 12,
                          ),
                          textStyle: const TextStyle(
                            fontFamily: 'HelveticaBlack',
                            fontSize: 17,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}