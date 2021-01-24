import 'package:userinfo/view/presenters/user_list_presenter.dart';
import 'package:userinfo/view/viewmodels/user_list_view_model.dart';

class UserListPresenterImpl extends UserListPresenter {
  const UserListPresenterImpl();
  
  @override
  Future<UserListViewModel> getUserList() =>
      Future.value(UserListViewModel([]));
}
