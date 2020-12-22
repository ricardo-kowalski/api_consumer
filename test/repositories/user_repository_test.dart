import 'package:api_consumer/repositories/user_repository.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  final repository = UserRepository();
  test('Deve trazer uma lista de ApiUser', () async {
    final list = await repository.fetchUsers();
    // print(list[0].name);
    expect(list[1].name, 'Ervin Howell');
  });
}
