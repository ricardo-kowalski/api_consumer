import 'package:api_consumer/models/api_users.dart';
import 'package:dio/dio.dart';

class UserRepository {
  final dio = Dio();
  final url = 'https://jsonplaceholder.typicode.com/users';

  Future<List<ApiUsers>> fetchUsers() async {
    final response = await dio.get(url);
    final list = response.data as List;

    List<ApiUsers> dados = [];

    for (var json in list) {
      final dado = ApiUsers.fromJson(json);
      dados.add(dado);
    }

    return dados;
  }
}
