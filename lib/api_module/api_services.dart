import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_social_media_app/common_module/app_const.dart';
import 'package:flutter_social_media_app/posts_module/model/post_model.dart';
import 'package:flutter_social_media_app/posts_module/model/post_model_list.dart';
import 'package:flutter_social_media_app/to_do_module/model/to_do_model.dart';
import 'package:flutter_social_media_app/to_do_module/model/to_do_model_list.dart';
import 'package:flutter_social_media_app/users_module/models/users_list_model.dart';
import 'package:flutter_social_media_app/users_module/models/users_model.dart';

class ApiServices {
  final dio = Dio();

  Future<List<TodoModel>?> getTodos() async {
    Response response = await dio.get(baseurl + todos);
    if (response.statusCode == 200) {
      return TodoModelList.fromJson(response.data).todoModelList;
    }
    return null;
  }

  Future<PostModel?> addNewPost({required Map<String, dynamic> body}) async {
    try {
      await EasyLoading.show(status: 'Please Wait ...', dismissOnTap: true);
      Response response = await dio.post(
        baseurl + posts,
        data: body,
        options: Options(
          headers: <String, dynamic>{
            'Content-type': 'application/json; charset=UTF-8'
          },
        ),
      );
      EasyLoading.dismiss();

      return PostModel.fromJson(response.data);
    } on DioException catch (e) {
      print('===exception after adding post=========$e===============');

      if (e.type == DioExceptionType.badResponse) {
        await EasyLoading.showError('Bad Response');
      } else if (e.type == DioExceptionType.connectionTimeout) {
        await EasyLoading.showError(
          'Connection time out Please try Again',
        );
      } else if (e.type == DioExceptionType.receiveTimeout) {
        await EasyLoading.showError(
          'Unable to connect to Server please try again',
        );
      } else if (e.type == DioExceptionType.cancel) {
        await EasyLoading.showError(
          'Request has been Canceled please try Again',
        );
      } else if (e.type == DioExceptionType.unknown) {
        await EasyLoading.showError('Something Went Wrong Please try Again');
      }
      return null;
    } catch (e) {
      await EasyLoading.showError(e.toString());
      return null;
    }
  }

  Future<PostModel?> updateMyPost({required Map<String, dynamic> body}) async {
    try {
      await EasyLoading.show(status: 'Please Wait ...', dismissOnTap: true);
      Response response = await dio.put(
        baseurl + updatePosts + body['id'].toString(),
        data: body,
        options: Options(
          headers: <String, dynamic>{
            'Content-type': 'application/json; charset=UTF-8'
          },
        ),
      );
      EasyLoading.dismiss();

      return PostModel.fromJson(response.data);
    } on DioException catch (e) {
      print('===exception on updating post=========$e===============');

      if (e.type == DioExceptionType.badResponse) {
        await EasyLoading.showError('Bad Response');
      } else if (e.type == DioExceptionType.connectionTimeout) {
        await EasyLoading.showError(
          'Connection time out Please try Again',
        );
      } else if (e.type == DioExceptionType.receiveTimeout) {
        await EasyLoading.showError(
          'Unable to connect to Server please try again',
        );
      } else if (e.type == DioExceptionType.cancel) {
        await EasyLoading.showError(
          'Request has been Canceled please try Again',
        );
      } else if (e.type == DioExceptionType.unknown) {
        await EasyLoading.showError('Something Went Wrong Please try Again');
      }
      return null;
    } catch (e) {
      await EasyLoading.showError(e.toString());
      return null;
    }
  }

  Future<List<PostModel>?> getPosts() async {
    Response response = await dio.get(baseurl + posts);
    if (response.statusCode == 200) {
      return PostModelList.fromJson(response.data).postModelList;
    }
    return null;
  }

  Future<List<User>?> getUsers() async {
    Response response = await dio.get(baseurl + users);
    if (response.statusCode == 200) {
      return UserList.fromJson(response.data).userList;
    }
    return null;
  }
}
