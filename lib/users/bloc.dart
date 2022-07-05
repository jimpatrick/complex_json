import 'package:complex_json/models/users/users_model.dart';
import 'package:rxdart/rxdart.dart';
import 'package:complex_json/users/repo.dart';

class UsersBloc {
  final _fetchAllUsers = PublishSubject<List<UsersModel>>();
  final UsersRepository _usersRepository = UsersRepository();

  Stream<List<UsersModel>> get fetchUsersList => _fetchAllUsers.stream;

  fetchAllUsers() async {
    dynamic data = await _usersRepository.fetchAllUsers();
    _fetchAllUsers.sink.add(data);
  }

  void dispose() {
    _fetchAllUsers.close();
  }
}
