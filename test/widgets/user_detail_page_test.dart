import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:userinfo/view/pages/user_detail_page.dart';
import 'package:userinfo/view/viewmodels/user_view_model.dart';

void main() {
  Future<void> showUserDetailPage(
      WidgetTester tester, UserViewModel userViewModel) async {
    return await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: UserDetailPage(userViewModel),
      ),
    ));
  }

  testWidgets('show name as title', (WidgetTester tester) async {
    final userViewModel = UserViewModel('John Doe');
    await showUserDetailPage(tester, userViewModel);

    expect(find.text('John Doe'), findsOneWidget);
    expect(find.byType(UserBodyView), findsOneWidget);
  });
}
