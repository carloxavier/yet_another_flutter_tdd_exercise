import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:userinfo/view/presenters/user_list_presenter.dart';
import 'package:userinfo/view/viewmodels/user_list_view_model.dart';
import 'package:userinfo/view/viewmodels/user_view_model.dart';
import 'package:userinfo/view/widgets/user_list_view.dart';

class MockUserListPresenter extends Mock implements UserListPresenter {}

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  UserListPresenter mockPresenter;
  NavigatorObserver mockNavigatorObserver;
  setUp(() {
    mockPresenter = MockUserListPresenter();
    mockNavigatorObserver = MockNavigatorObserver();
  });

  Future showUserList(WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: UserListView(userListPresenter: mockPresenter),
      ),
      navigatorObservers: [mockNavigatorObserver],
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
    expect(find.byType(UserListTileView), findsNWidgets(2));
    expect(find.text('Carlo Lopez'), findsOneWidget);
    expect(find.text('Daniel Martinez'), findsOneWidget);
  });

  testWidgets('navigate to detail page on click', (WidgetTester tester) async {
    when(mockPresenter.getUserList()).thenAnswer(
      (_) => Future.value(
        UserListViewModel([
          UserViewModel('Juan Arango'),
          UserViewModel('Rafa Nadal'),
        ]),
      ),
    );

    await showUserList(tester);
    await tester.pump();
    await tester.tap(find.text('Juan Arango'));
    await tester.pump();

    verify(mockNavigatorObserver.didPush(any, any));
  });
}
