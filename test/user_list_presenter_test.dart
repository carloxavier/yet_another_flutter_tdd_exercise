import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:userinfo/domain/model/user.dart';
import 'package:userinfo/domain/users_repository.dart';
import 'package:userinfo/view/presenters/user_list_presenter.dart';
import 'package:userinfo/view/presenters/user_list_presenter_impl.dart';

class MockUserRespository extends Mock implements UsersRepository {}

void main() {
  UsersRepository mockUsersRepository;
  UserListPresenter presenter;
  setUp(() {
    mockUsersRepository = MockUserRespository();
    presenter = UserListPresenterImpl(mockUsersRepository);
  });
  test('get a list of users', () async {
    when(mockUsersRepository.getUsers()).thenAnswer(
      (_) => Future.value(
        [User(id: 1, name: 'John Doe', username: 'johndoe')],
      ),
    );
    presenter.getUserList();

    final usersViewModels = await presenter.getUserList();
    expect(usersViewModels.users.length, equals(1));
    expect(usersViewModels.users.first.name, equals('John Doe'));
  });
}
