import 'package:flutter/material.dart';
import 'package:flutter_social_media_app/posts_module/controller/post_controller.dart';
import 'package:flutter_social_media_app/posts_module/view/add_post_screen.dart';
import 'package:get/get.dart';

class PostsScreen extends StatelessWidget {
  PostsScreen({super.key});

  final PostController postController = Get.put(PostController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ElevatedButton.icon(
        onPressed: () {
          Get.to(AddOrUpdatePostScreen());
        },
        label: const Text('Add New Post'),
        icon: const Icon(Icons.post_add),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Social Media App'),
      ),
      body: Obx(
        () => postController.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: postController.posts.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: ListTile(
                      title: Text(
                        postController.posts[index].title,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Column(
                        children: [
                          Text(postController.posts[index].body),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Icon(Icons.favorite),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8),
                                    child: Text(
                                      postController.posts[index].id.toString(),
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                  ),
                                ],
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.comment_bank),
                              ),
                              IconButton(
                                onPressed: () {
                                  Get.to(
                                    AddOrUpdatePostScreen(
                                      postModel: postController.posts[index],
                                    ),
                                  );
                                },
                                icon: const Icon(Icons.edit),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
