import 'package:flutter_social_media_app/api_module/api_services.dart';
import 'package:flutter_social_media_app/users_module/models/users_model.dart';
import 'package:get/get.dart';

class UsersController extends GetxController {
  var isLoading = true.obs;
  var usersLists = <User>[].obs;

  fetchUsers() async {
    try {
      isLoading(true);
      var users = await ApiServices().getUsers();
      if (users != null) {
        usersLists.value = users;
      }
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchUsers();
  }
}
