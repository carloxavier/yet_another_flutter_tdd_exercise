import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:userinfo/view/pages/home_page.dart';
import 'package:userinfo/view/widgets/user_list_view.dart';

void main() {
  Future<void> showHomePage(WidgetTester tester) async {
    return await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(body: HomePage()),
      ),
    );
  }

  testWidgets('show user list', (WidgetTester tester) async {
    await showHomePage(tester);

    expect(find.byType(UserListView), findsOneWidget);
  });

  testWidgets('show app bar', (WidgetTester tester) async {
    await showHomePage(tester);

    expect(find.byType(AppBar), findsOneWidget);
  });
}
