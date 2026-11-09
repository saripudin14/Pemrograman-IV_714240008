import 'package:flutter_test/flutter_test.dart';
import 'package:uts_714240008/main.dart';

void main() {
  testWidgets('App renders Home Screen with student identity', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    // Pastikan nama dan NPM mahasiswa tampil di layar
    expect(find.text('Muhammad Arif Rivaldi'), findsOneWidget);
    expect(find.text('NPM: 714240008'), findsOneWidget);
    expect(find.text('UTS Pemrograman IV'), findsOneWidget);
  });
}
