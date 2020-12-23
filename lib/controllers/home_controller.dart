import 'package:api_consumer/models/api_users.dart';
import 'package:api_consumer/repositories/user_repository.dart';
import 'package:flutter/widgets.dart';

class HomeController {
  List<ApiUsers> dados = [];
  final repository = UserRepository();
  final state = ValueNotifier<HomeState>(HomeState.start);

  Future start() async {
    state.value = HomeState.loading;
    try {
      dados = await repository.fetchUsers();
      state.value = HomeState.sucess;
    } catch (e) {
      state.value = HomeState.error;
    }
  }
}

enum HomeState { start, loading, sucess, error }
