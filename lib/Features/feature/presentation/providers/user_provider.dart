import 'package:flutter/material.dart';

import '../../data/models/Users.dart';
import '../../data/repositories/users_repo.dart';

class UserProvider extends ChangeNotifier {
  UsersRepo usersRepo;

  UserProvider(this.usersRepo);
  int selectedBrandId = -1;
  String selectedBrandName = '';
  String selectedProjectSerial = '';
  List<User> users = [];
  Future<List<User>> getAllUsersList() async {
    print('dddddddddd');
    users = await usersRepo.getAllUsers();
    notifyListeners();
    return users;
  }

  User userDetails = User();
  Future<User> getUserDetails(int userId) async {
    userDetails = await usersRepo.getUserById(userId);
    print('userDetails');
    notifyListeners();
    return userDetails;
  }
}
