class ContactValidator {
 
  static String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Nama wajib diisi';
    }
    final trimmed = value.trim();

    // Hanya mengandung huruf dan spasi
    if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(trimmed)) {
      return 'Nama hanya boleh mengandung huruf dan spasi';
    }

    // Terdiri dari minimal 2 kata
    final words = trimmed.split(RegExp(r'\s+')).where((w) => w.isNotEmpty).toList();
    if (words.length < 2) {
      return 'Nama harus terdiri dari minimal 2 kata';
    }

    // Setiap kata harus dimulai dengan huruf kapital
    for (final word in words) {
      if (!RegExp(r'^[A-Z]').hasMatch(word)) {
        return 'Setiap kata harus dimulai dengan huruf kapital';
      }
    }

    return null;
  }

  
  static String? validatePhone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Nomor telepon wajib diisi';
    }
    final text = value.trim();

    // Hanya berisi digit 0-9
    if (!RegExp(r'^[0-9]+$').hasMatch(text)) {
      return 'Nomor telepon hanya boleh berisi angka (0-9)';
    }

    if (!text.startsWith('62')) {
      return 'Nomor telepon wajib diawali 62 (tanpa tanda +)';
    }

    if (text.length < 8 || text.length > 13) {
      return 'Panjang nomor telepon harus 8-13 digit';
    }

    return null;
  }
}
