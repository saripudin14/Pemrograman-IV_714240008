
import 'package:flutter/material.dart';
import 'model/tourism_place.dart';

const TextStyle infoTextStyle = TextStyle(
  fontFamily: 'Staatliches',
  fontSize: 13,
);

class DetailScreen extends StatelessWidget {
  final TourismPlace place;

  const DetailScreen({
    super.key,
    required this.place,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Gambar utama dan tombol kembali
            Stack(
              children: [
                Image.asset(
                  place.imageAsset,
                  width: double.infinity,
                  height: 250,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const SizedBox(
                      height: 250,
                      child: ColoredBox(
                        color: Color(0xFFE0E0E0),
                        child: Center(
                          child: Icon(
                            Icons.broken_image,
                            size: 40,
                          ),
                        ),
                      ),
                    );
                  },
                ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: CircleAvatar(
                      backgroundColor: Colors.grey,
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back),
                        color: Colors.white,
                        tooltip: 'Kembali',
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // Nama wisata
            Container(
              margin: const EdgeInsets.only(
                top: 16,
                bottom: 12,
              ),
              child: Text(
                place.name.toUpperCase(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: 'Staatliches',
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // Informasi wisata
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  Expanded(
                    child: _InformationItem(
                      icon: Icons.calendar_today,
                      label: place.openDays,
                    ),
                  ),
                  Expanded(
                    child: _InformationItem(
                      icon: Icons.access_time,
                      label: place.openTime,
                    ),
                  ),
                  Expanded(
                    child: _InformationItem(
                      icon: Icons.monetization_on,
                      label: place.ticketPrice,
                    ),
                  ),
                ],
              ),
            ),

            // Deskripsi wisata
            Container(
              padding: const EdgeInsets.all(16),
              child: Text(
                place.description,
                textAlign: TextAlign.justify,
                style: const TextStyle(
                  color: Color(0xFF65428A),
                  fontSize: 15,
                ),
              ),
            ),

            // Galeri foto dinamis
            SizedBox(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: place.imageUrls.map((url) {
                  return Padding(
                    padding: const EdgeInsets.all(4),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: AspectRatio(
                        aspectRatio: 16 / 9,
                        child: Image.network(
                          url,
                          fit: BoxFit.cover,
                          errorBuilder: (
                            context,
                            error,
                            stackTrace,
                          ) {
                            return const ColoredBox(
                              color: Color(0xFFE0E0E0),
                              child: Center(
                                child: Icon(Icons.broken_image),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}

// Widget informasi yang digunakan berulang
class _InformationItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const _InformationItem({
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: Colors.green[700],
        ),
        const SizedBox(height: 8),
        Text(
          label,
          textAlign: TextAlign.center,
          style: infoTextStyle,
        ),
      ],
    );
  }
}
