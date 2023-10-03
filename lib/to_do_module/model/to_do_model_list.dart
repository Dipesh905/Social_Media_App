import 'package:flutter_social_media_app/to_do_module/model/to_do_model.dart';

class TodoModelList {
  TodoModelList({required this.todoModelList});

  factory TodoModelList.fromJson(List<dynamic> json) => TodoModelList(
        todoModelList: json
            .map((e) => TodoModel.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  List<TodoModel> todoModelList;
}
