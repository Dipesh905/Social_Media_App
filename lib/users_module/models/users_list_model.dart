import 'package:flutter_social_media_app/users_module/models/users_model.dart';

class UserList {
  UserList({required this.userList});

  factory UserList.fromJson(List<dynamic> json) => UserList(
        userList:
            json.map((e) => User.fromJson(e as Map<String, dynamic>)).toList(),
      );

  List<User> userList;
}
