import 'package:flutter/material.dart';
import 'package:userinfo/view/presenters/user_list_presenter.dart';
import 'package:userinfo/view/presenters/user_list_presenter_impl.dart';
import 'package:userinfo/view/viewmodels/user_list_view_model.dart';

class UserListView extends StatelessWidget {
  static const errorTextKey = Key('UserListView-errorKeyText');
  final UserListPresenter userListPresenter;
  const UserListView({
    Key key,
    this.userListPresenter = const UserListPresenterImpl(),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UserListViewModel>(
        future: userListPresenter.getUserList(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
                child: Text(
              'Error presenting users!',
              key: errorTextKey,
            ));
          } else if (!snapshot.hasData) {
            return CircularProgressIndicator();
          } else {
            final viewmodel = snapshot.data;
            return ListView.builder(
              itemCount: viewmodel.users.length,
              itemBuilder: (_, position) {
                return Text(viewmodel.users[position].name);
              },
            );
          }
        });
  }
}
