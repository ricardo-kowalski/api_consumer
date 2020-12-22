import 'package:api_consumer/models/api_users.dart';
import 'package:api_consumer/repositories/user_repository.dart';

class HomeController {
  List<ApiUsers> dados = [];
  final repository = UserRepository();

  Future start() async {
    dados = await repository.fetchUsers();
  }
}
