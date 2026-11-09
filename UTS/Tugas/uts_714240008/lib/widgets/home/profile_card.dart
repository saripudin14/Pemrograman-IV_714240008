import 'package:flutter/material.dart';

/// Kartu profil identitas mahasiswa (Ref Pertemuan 5)
class ProfileCard extends StatelessWidget {
  static const String namaMahasiswa = 'Muhammad Arif Rivaldi';
  static const String npmMahasiswa = '714240008';
  static const String kelasMahasiswa = '3A – D4 Teknik Informatika';
  static const String mataKuliah = 'Pemrograman IV';
  static const String dosenPengampu = 'Indra Riksa Herlambang, M.Kom., SFPC.';

  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: theme.colorScheme.primary,
                  width: 3,
                ),
              ),
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.grey.shade200,
                backgroundImage: const AssetImage('images/SSB.jpg'),
              ),
            ),
            const SizedBox(height: 14),
            const Text(
              namaMahasiswa,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
              decoration: BoxDecoration(
                color: theme.colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                'NPM: $npmMahasiswa',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: theme.colorScheme.onPrimaryContainer,
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Divider(),
            const SizedBox(height: 12),
            _buildInfoRow(Icons.class_outlined, 'Kelas', kelasMahasiswa),
            const SizedBox(height: 10),
            _buildInfoRow(Icons.menu_book_rounded, 'Mata Kuliah', mataKuliah),
            const SizedBox(height: 10),
            _buildInfoRow(Icons.person_pin_rounded, 'Dosen', dosenPengampu),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, size: 20, color: Colors.grey.shade600),
        const SizedBox(width: 12),
        SizedBox(
          width: 85,
          child: Text(
            label,
            style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
          ),
        ),
        const Text(': '),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}
