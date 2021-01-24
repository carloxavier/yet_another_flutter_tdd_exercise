import 'package:userinfo/data/data_source.dart';
import 'package:userinfo/domain/model/user.dart';
import 'package:userinfo/domain/users_repository.dart';

class UsersRepositoryImpl extends UsersRepository {
  final DataSource dataSource;
  const UsersRepositoryImpl([this.dataSource = const DataSource()]);

  @override
  Future<List<User>> getUsers() {
    final usersJson = dataSource.users;
    if (usersJson == null) {
      return Future.value([]);
    }
    var users = usersJson.map((jsonUser) => User.fromJson(jsonUser));
    return Future.value(users.toList());
  }
}
