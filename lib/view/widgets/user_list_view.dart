import 'package:flutter/material.dart';
import 'package:userinfo/view/pages/user_detail_page.dart';
import 'package:userinfo/view/presenters/user_list_presenter.dart';
import 'package:userinfo/view/presenters/user_list_presenter_impl.dart';
import 'package:userinfo/view/viewmodels/user_list_view_model.dart';
import 'package:userinfo/view/viewmodels/user_view_model.dart';

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
                final user = viewmodel.users[position];
                return 
                UserListTileView(user: user);
              },
            );
          }
        });
  }
}

class UserListTileView extends StatelessWidget {
  const UserListTileView({
    Key key,
    @required this.user,
  }) : super(key: key);

  final UserViewModel user;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Text(user.name.characters.first),
      ),
      title: Text(user.name),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => UserDetailPage(user),
          ),
        );
      },
    );
  }
}
