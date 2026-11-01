import 'package:flutter_test/flutter_test.dart';

import 'package:lab_streaming/main.dart';

void main() {
  testWidgets('La app inicia en la pantalla de plataformas', (WidgetTester tester) async {
    await tester.pumpWidget(const StreamingApp());

    expect(find.text('STREAMING LAB'), findsOneWidget);
  });
}