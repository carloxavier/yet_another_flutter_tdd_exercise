import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:userinfo/data/data_source.dart';
import 'package:userinfo/domain/model/user.dart';
import 'package:userinfo/domain/users_repository_impl.dart';

class MockDataSource extends Mock implements DataSource {}

void main() {
  DataSource mockDataSource;
  UsersRepositoryImpl usersRepository;
  final data = [
    {
      "id": 1,
      "name": "Leanne Graham",
      "username": "Bret",
      "email": "Sincere@april.biz",
      "address": {
        "street": "Kulas Light",
        "suite": "Apt. 556",
        "city": "Gwenborough",
        "zipcode": "92998-3874",
        "geo": {"lat": "-37.3159", "lng": "81.1496"}
      },
      "phone": "1-770-736-8031 x56442",
      "website": "hildegard.org",
      "company": {
        "name": "Romaguera-Crona",
        "catchPhrase": "Multi-layered client-server neural-net",
        "bs": "harness real-time e-markets"
      }
    }
  ];
  setUp(() {
    mockDataSource = MockDataSource();
    usersRepository = UsersRepositoryImpl(mockDataSource);
  });
  test('return an empty list on null response', () async {
    when(mockDataSource.users).thenReturn(null);
    final users = await usersRepository.getUsers();

    expect(users, equals([]));
  });
  test('return an empty list on empty response', () async {
    when(mockDataSource.users).thenReturn([]);
    final users = await usersRepository.getUsers();

    expect(users, equals([]));
  });

  test('return a list of users', () async {
    when(mockDataSource.users).thenReturn(data);
    final users = await usersRepository.getUsers();

    expect(
      users,
      equals([User(id: 1, name: 'Leanne Graham', username: 'Bret')]),
    );
  });
}
