import '../data_sources/web_services.dart';
import '../models/Users.dart';

class UsersRepo {
  WebServices webServices;

  UsersRepo(this.webServices);

  Future<List<User>> getAllUsers() async {
    // var response =
    return await webServices.getAllUsers();
    // print('response ${response.map((e) => e.name)}');
    // return response.map((user) => User.fromJson(user.toJson())).toList();
  }

  Future<User> getUserById(int userId) async {
    // var response = await webServices.getUserById(userId);
    // print('responseId ${response.name})}');
    //
    // return User.fromJson(response.toJson());
    return await webServices.getUserById(userId);
  }

  Future<User> createNewUser(User newUser, String token) async {
    return await webServices.createNewUser(newUser, token);
  }
}
