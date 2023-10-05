import 'package:flutter_social_media_app/api_module/api_services.dart';
import 'package:flutter_social_media_app/posts_module/model/post_model.dart';
import 'package:get/get.dart';

class PostController extends GetxController {
  var isLoading = true.obs;
  var posts = <PostModel>[].obs;

  fetchPosts() async {
    try {
      isLoading(true);
      var allPosts = await ApiServices().getPosts();
      if (allPosts != null) {
        posts.value = allPosts;
      }
    } finally {
      isLoading(false);
    }
  }

  Future<PostModel?> addNewPosts({required Map<String, dynamic> body}) async {
    try {
      isLoading(true);
      var addedPost = await ApiServices().addNewPost(body: body);

      return addedPost;
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchPosts();
  }
}
