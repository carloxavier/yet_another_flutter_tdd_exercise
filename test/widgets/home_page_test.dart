import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:userinfo/view/pages/home_page.dart';
import 'package:userinfo/view/widgets/user_list_view.dart';

void main() {
  testWidgets('show user list', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: HomePage(),
      ),
    ));

    expect(find.byType(UserListView), findsOneWidget);
  });
}
