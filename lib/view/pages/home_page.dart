import 'package:flutter/material.dart';
import 'package:userinfo/view/widgets/user_list_view.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Contacts')),
      body: UserListView(),
    );
  }
}
