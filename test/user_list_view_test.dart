import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:userinfo/view/pages/home_page.dart';
import 'package:userinfo/view/presenters/user_list_presenter.dart';
import 'package:userinfo/view/viewmodels/user_list_view_model.dart';
import 'package:userinfo/view/viewmodels/user_view_model.dart';

class MockUserListPresenter extends Mock implements UserListPresenter {}

void main() {
  UserListPresenter mockPresenter;

  setUp(() {
    mockPresenter = MockUserListPresenter();
  });

  Future showUserList(WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: UserListView(userListPresenter: mockPresenter),
      ),
    ));
  }

  testWidgets('show error on user list error', (WidgetTester tester) async {
    when(mockPresenter.getUserList())
        .thenAnswer((_) => Future.error('dummy error'));

    await showUserList(tester);
    await tester.pump();

    expect(find.byKey(UserListView.errorTextKey), findsOneWidget);
  });

  testWidgets('show progress indicator on loading',
      (WidgetTester tester) async {
    await showUserList(tester);

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('show empty users list', (WidgetTester tester) async {
    when(mockPresenter.getUserList())
        .thenAnswer((_) => Future.value(UserListViewModel([])));

    await showUserList(tester);
    await tester.pump();

    expect(find.byType(ListView), findsOneWidget);
  });

  testWidgets('show users list', (WidgetTester tester) async {
    when(mockPresenter.getUserList()).thenAnswer(
      (_) => Future.value(
        UserListViewModel([
          UserViewModel('Carlo Lopez'),
          UserViewModel('Daniel Martinez'),
        ]),
      ),
    );

    await showUserList(tester);
    await tester.pump();

    expect(find.byType(ListView), findsOneWidget);
    expect(find.text('Carlo Lopez'), findsOneWidget);
    expect(find.text('Daniel Martinez'), findsOneWidget);
  });
}
