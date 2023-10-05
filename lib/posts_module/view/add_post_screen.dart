import 'package:flutter/material.dart';
import 'package:flutter_social_media_app/common_module/widgets/button_widget.dart';
import 'package:flutter_social_media_app/common_module/widgets/input_field_widgets.dart';
import 'package:flutter_social_media_app/posts_module/controller/post_controller.dart';
import 'package:flutter_social_media_app/posts_module/model/post_model.dart';
import 'package:get/get.dart';

class AddOrUpdatePostScreen extends StatelessWidget {
  AddOrUpdatePostScreen({super.key, this.postModel});

  final PostModel? postModel;
  final PostController postController = Get.find();

  @override
  Widget build(BuildContext context) {
    final TextEditingController titleController =
        TextEditingController(text: postModel != null ? postModel!.title : '');
    final TextEditingController disController =
        TextEditingController(text: postModel != null ? postModel!.body : '');
    return Scaffold(
      appBar: AppBar(
        title: Text(postModel != null ? 'Update Post' : 'Add New Post'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: InputFieldWidget(
                  controller: titleController,
                  labelText: "Title",
                  validator: (value) =>
                      value == null ? "Enter the title" : null,
                ),
              ),
              InputFieldWidget(
                controller: disController,
                labelText: "Description",
                validator: (value) =>
                    value == null ? "Enter the description" : null,
              ),
              ButtonWidget(
                  onPressed: () async {
                    if (postModel != null) {
                      PostModel? updatedPost = await postController.updatePost(
                        body: {
                          'title': titleController.text,
                          'body': disController.text,
                          'userId': postModel!.userId,
                          'id': postModel!.id
                        },
                      );

                      if (updatedPost != null) {
                        Get.defaultDialog(
                          title: 'Sucess',
                          backgroundColor: Colors.green,
                          content: Column(
                            children: [
                              const Text(
                                  'Your post has been updated sucessfully'),
                              Text('Title: ${updatedPost.title}'),
                              Text('Discription: ${updatedPost.body}'),
                            ],
                          ),
                        );

                        titleController.clear();
                        disController.clear();
                      }
                    } else {
                      PostModel? recentlyAddedPost =
                          await postController.addNewPosts(
                        body: {
                          'title': titleController.text,
                          'body': disController.text,
                          'userId': 1,
                        },
                      );

                      if (recentlyAddedPost != null) {
                        Get.defaultDialog(
                          title: 'Sucess',
                          backgroundColor: Colors.green,
                          content: Column(
                            children: [
                              const Text(
                                  'Your post has been sucessfully Uploaded'),
                              Text('Title: ${recentlyAddedPost.title}'),
                              Text('Discription: ${recentlyAddedPost.body}'),
                            ],
                          ),
                        );

                        titleController.clear();
                        disController.clear();
                      }
                    }
                  },
                  buttonTitle: postModel != null ? 'Update Post' : 'Add Post'),
            ],
          ),
        ),
      ),
    );
  }
}
