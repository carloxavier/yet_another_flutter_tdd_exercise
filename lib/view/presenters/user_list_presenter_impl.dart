import 'package:userinfo/domain/users_repository.dart';
import 'package:userinfo/domain/users_repository_impl.dart';
import 'package:userinfo/view/presenters/user_list_presenter.dart';
import 'package:userinfo/view/viewmodels/user_list_view_model.dart';
import 'package:userinfo/view/viewmodels/user_view_model.dart';

class UserListPresenterImpl extends UserListPresenter {
  final UsersRepository usersRepository;
  const UserListPresenterImpl([
    this.usersRepository = const UsersRepositoryImpl(),
  ]);

  @override
  Future<UserListViewModel> getUserList() async {
    final users = await usersRepository.getUsers();
    final usersViewModelList =
        users.map((user) => UserViewModel(user.name)).toList();
    return UserListViewModel(usersViewModelList);
  }
}
