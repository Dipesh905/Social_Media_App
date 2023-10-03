import 'package:flutter_social_media_app/api_module/api_services.dart';
import 'package:flutter_social_media_app/to_do_module/model/to_do_model.dart';
import 'package:get/get.dart';

class ToDoController extends GetxController {
  var isLoading = true.obs;
  var toDoLists = <TodoModel>[].obs;

  fetchToDos() async {
    try {
      isLoading(true);
      var todos = await ApiServices().getTodos();
      if (todos != null) {
        toDoLists.value = todos;
      }
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchToDos();
  }
}
