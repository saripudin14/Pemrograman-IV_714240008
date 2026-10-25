import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final String nama;
  final String npm;
  const DetailScreen({
    super.key,
    required this.nama,
    required this.npm,
  });

  static const Color primaryColor = Color(0xFF3F5728);
  static const String fontJudul = 'Oasis';
  static const String fontParagraf = 'HelveticaBlack';

  static const List<String> gambarAktivitas = [
    'images/Konser.png',
    'images/Nonton Bola.png',
  ];

  static const List<String> judulAktivitas = [
    'Konseran',
    'Nonton Bola',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9F4),

      appBar: AppBar(
        title: const Text(
          'Detail Profil',
          style: TextStyle(fontFamily: fontJudul),
        ),
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 650),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  SizedBox(
                    width: double.infinity,
                    child: Card(
                      elevation: 4,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(22),
                        child: Column(
                          children: [
                            const CircleAvatar(
                              radius: 35,
                              backgroundColor: Color(0xFFE4EBD9),
                              child: Icon(
                                Icons.person,
                                size: 42,
                                color: primaryColor,
                              ),
                            ),

                            const SizedBox(height: 15),

                            Text(
                              nama,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontFamily: fontJudul,
                                fontSize: 24,
                                color: primaryColor,
                              ),
                            ),

                            const SizedBox(height: 8),

                            Text(
                              'NPM: $npm',
                              style: const TextStyle(
                                fontFamily: fontParagraf,
                                fontSize: 18,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 25),

                  const Text(
                    'Tentang Saya',
                    style: TextStyle(
                      fontFamily: fontJudul,
                      fontSize: 23,
                      color: primaryColor,
                    ),
                  ),

                  const SizedBox(height: 12),

                  const Text(
                    'Halo ! saya adalah mahasiswa yang memiliki '
                    'minat dalam bidang pemrograman dan pengembangan aplikasi.'
                    ' Selain itu, saya memiliki hobi '
                    'konseran dan menonton King Liverpool.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontFamily: fontParagraf,
                      fontSize: 16,
                      height: 1.6,
                      color: Colors.black87,
                    ),
                  ),

                  const SizedBox(height: 25),

                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE4EBD9),
                      borderRadius: BorderRadius.circular(15),
                      border: const Border(
                        left: BorderSide(
                          color: primaryColor,
                          width: 6,
                        ),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.format_quote,
                          size: 36,
                          color: primaryColor,
                        ),
                        const SizedBox(height: 6),
 
                        const Text(
                          'Normalisasi berterima kasih atas segala keputusanmu\n'
                          'Lagu-lagu dan musisi-musisi itu hanya hadir untuk menemani\n'
                          'Yang menyelamatkanmu hanya dirimu\n'
                          'Gusti pada dirimu\n'
                          'Semesta pada dirimu\n'
                          'Mbah-mbahmu pada dirimu',
                          style: TextStyle(
                            fontFamily: fontParagraf,
                            fontSize: 12,
                            height: 1.6,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 12),
 
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            '- Farid Stevy',
                            style: const TextStyle(
                              fontFamily: fontParagraf,
                              fontSize: 14,
                              color: primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 28),

                  const Text(
                    'Galeri Aktivitas',
                    style: TextStyle(
                      fontFamily: fontJudul,
                      fontSize: 23,
                      color: primaryColor,
                    ),
                  ),

                  const SizedBox(height: 8),

                  const SizedBox(height: 15),

                  SizedBox(
                    height: 215,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: gambarAktivitas.length,
                      itemBuilder: (context, index) {
                        return Container(
                          width: 230,
                          margin: const EdgeInsets.only(right: 14),
                          child: Card(
                            color: Colors.white,
                            elevation: 3,
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment.stretch,
                              children: [

                                // GAMBAR AKTIVITAS
                                Image.asset(
                                  gambarAktivitas[index],
                                  height: 155,
                                  fit: BoxFit.cover,
                                  errorBuilder:
                                      (context, error, stackTrace) {
                                    return Container(
                                      height: 155,
                                      color: const Color(0xFFE4EBD9),
                                      child: Icon(
                                        index == 0
                                            ? Icons.music_note
                                            : Icons.sports_soccer,
                                        size: 60,
                                        color: primaryColor,
                                      ),
                                    );
                                  },
                                ),

                                const SizedBox(height: 12),

                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                  ),
                                  child: Text(
                                    judulAktivitas[index],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontFamily: fontJudul,
                                      fontSize: 16,
                                      color: primaryColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 30),

                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back),
                      label: const Text('Kembali'),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: primaryColor,
                        side: const BorderSide(
                          color: primaryColor,
                          width: 2,
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 15,
                        ),
                        textStyle: const TextStyle(
                          fontFamily: fontJudul,
                          fontSize: 18,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}