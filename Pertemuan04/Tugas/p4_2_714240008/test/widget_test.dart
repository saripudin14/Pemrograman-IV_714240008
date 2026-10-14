import 'package:flutter_test/flutter_test.dart';

import 'package:p4_2_714240008/main.dart';

void main() {
  testWidgets('Tugas Pertemuan 4 screen renders correctly', (tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Tugas Pertemuan 4'), findsOneWidget);
    expect(find.text('Box 1'), findsOneWidget);
    expect(find.text('Box 2'), findsOneWidget);
    expect(find.text('Box 3'), findsOneWidget);
  });
}
