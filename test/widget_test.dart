// This is a basic Flutter widget test.
// To perform an interaction with a widget in your test, use the WidgetTester utility that Flutter provides.
// For more information, see https://flutter.dev/docs/cookbook/testing/widget/introduction

//import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nutri_ai/main.dart';

void main() {
  testWidgets('App carrega e exibe título', (WidgetTester tester) async {
    await tester.pumpWidget(const NutriAIApp());
    expect(find.text('NutriAI'), findsOneWidget);
  });
} 