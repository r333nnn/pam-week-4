import 'package:flutter_test/flutter_test.dart';
import 'package:sesi3/main.dart';

void main() {
  testWidgets('Aplikasi katalog menampilkan daftar produk', (WidgetTester tester) async {
    await tester.pumpWidget(const KatalogApp());

    expect(find.text('Katalog Produk'), findsOneWidget);
    expect(find.text('Kursi Minimalis'), findsOneWidget);
  });
}