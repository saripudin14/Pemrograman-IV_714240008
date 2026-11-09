import 'package:flutter/material.dart';

/// Model data untuk menyimpan informasi kontak
class Contact {
  final String id;
  String name;
  String phone;
  DateTime date;
  Color color;
  String filePath;
  String fileName;

  Contact({
    required this.id,
    required this.name,
    required this.phone,
    required this.date,
    required this.color,
    required this.filePath,
    required this.fileName,
  });

  /// Memeriksa apakah berkas yang dipilih adalah gambar (JPG, JPEG, PNG)
  bool get isImage {
    final lower = fileName.toLowerCase();
    return lower.endsWith('.jpg') || lower.endsWith('.jpeg') || lower.endsWith('.png');
  }
}
