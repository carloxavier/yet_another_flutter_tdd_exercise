import 'package:flutter/material.dart';
import 'package:userinfo/view/viewmodels/user_view_model.dart';

class UserDetailPage extends StatelessWidget {
  final UserViewModel userViewModel;
  const UserDetailPage(this.userViewModel);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: UserBodyView(),
      appBar: AppBar(
        title: Text(userViewModel.name),
      ),
    );
  }
}

class UserBodyView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
