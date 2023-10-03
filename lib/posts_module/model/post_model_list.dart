import 'package:flutter_social_media_app/posts_module/model/post_model.dart';

class PostModelList {
  PostModelList({required this.postModelList});

  factory PostModelList.fromJson(List<dynamic> json) => PostModelList(
        postModelList: json
            .map((e) => PostModel.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  List<PostModel> postModelList;
}
