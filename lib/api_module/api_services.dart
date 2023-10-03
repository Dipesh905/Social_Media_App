import 'package:dio/dio.dart';
import 'package:flutter_social_media_app/common_module/app_const.dart';
import 'package:flutter_social_media_app/posts_module/model/post_model.dart';
import 'package:flutter_social_media_app/posts_module/model/post_model_list.dart';
import 'package:flutter_social_media_app/to_do_module/model/to_do_model.dart';
import 'package:flutter_social_media_app/to_do_module/model/to_do_model_list.dart';

class ApiServices {
  final dio = Dio();

  Future<List<TodoModel>?> getTodos() async {
    Response response = await dio.get('${AppConst.baseurl}${AppConst.todos}');
    if (response.statusCode == 200) {
      return TodoModelList.fromJson(response.data).todoModelList;
    }
    return null;
  }

  Future<List<PostModel>?> getPosts() async {
    Response response = await dio.get('${AppConst.baseurl}${AppConst.posts}');
    if (response.statusCode == 200) {
      return PostModelList.fromJson(response.data).postModelList;
    }
    return null;
  }
}
