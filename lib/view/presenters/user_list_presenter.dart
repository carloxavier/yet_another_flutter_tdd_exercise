import 'package:userinfo/view/viewmodels/user_list_view_model.dart';

abstract class UserListPresenter {
  const UserListPresenter();
  
  Future<UserListViewModel> getUserList();
}
