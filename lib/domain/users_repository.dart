import 'package:userinfo/domain/model/user.dart';

abstract class UsersRepository {
  const UsersRepository();
  Future<List<User>> getUsers();
}
