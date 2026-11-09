import 'package:flutter_test/flutter_test.dart';
import 'package:uts_714240008/utils/contact_validator.dart';

void main() {
  group('UTS Validation Unit Tests', () {
    test('Nama: validasi 2 kata dan kapitalisasi', () {
      expect(ContactValidator.validateName('Muhammad Arif'), isNull);
      expect(ContactValidator.validateName('Arif Rivaldi'), isNull);
      expect(ContactValidator.validateName('   Arif Rivaldi   '), isNull);

      expect(ContactValidator.validateName(''), 'Nama wajib diisi');
      expect(ContactValidator.validateName('Arif'), 'Nama harus terdiri dari minimal 2 kata');
      expect(ContactValidator.validateName('arif rivaldi'), 'Setiap kata harus dimulai dengan huruf kapital');
      expect(ContactValidator.validateName('Arif rivaldi'), 'Setiap kata harus dimulai dengan huruf kapital');
      expect(ContactValidator.validateName('Arif123 Rivaldi'), 'Nama hanya boleh mengandung huruf dan spasi');
      expect(ContactValidator.validateName('Arif @Rivaldi'), 'Nama hanya boleh mengandung huruf dan spasi');
    });

    test('Nomor Telepon: diawali 62 dan panjang 8-13 digit', () {
      expect(ContactValidator.validatePhone('6281222211122'), isNull);
      expect(ContactValidator.validatePhone('62812345'), isNull);

      expect(ContactValidator.validatePhone(''), 'Nomor telepon wajib diisi');
      expect(ContactValidator.validatePhone('08123456789'), 'Nomor telepon wajib diawali 62 (tanpa tanda +)');
      expect(ContactValidator.validatePhone('+62812345678'), 'Nomor telepon hanya boleh berisi angka (0-9)');
      expect(ContactValidator.validatePhone('62812'), 'Panjang nomor telepon harus 8-13 digit');
      expect(ContactValidator.validatePhone('628122221112233'), 'Panjang nomor telepon harus 8-13 digit');
      expect(ContactValidator.validatePhone('62812abc345'), 'Nomor telepon hanya boleh berisi angka (0-9)');
    });
  });
}
