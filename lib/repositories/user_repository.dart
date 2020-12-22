import 'package:api_consumer/models/api_users.dart';
import 'package:dio/dio.dart';

class UserRepository {
  Dio dio;
  final url = 'https://jsonplaceholder.typicode.com/users';

  UserRepository([Dio client]) {
    dio = client ?? Dio();
  }

  Future<List<ApiUsers>> fetchUsers() async {
    final response = await dio.get(url);
    final list = response.data as List;

    return list.map((json) => ApiUsers.fromJson(json)).toList();
  }
}
