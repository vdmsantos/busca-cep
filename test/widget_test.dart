import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:busca_cep/main.dart';

void main() {
  testWidgets('Exibe input e dados mockados do CEP', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.byType(TextField), findsOneWidget);
    expect(find.text('01001-000'), findsOneWidget);
    expect(find.text('Praça da Sé'), findsOneWidget);
  });
}
