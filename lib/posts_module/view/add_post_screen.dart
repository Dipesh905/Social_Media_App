import 'package:flutter/material.dart';
import 'package:flutter_social_media_app/common_module/widgets/button_widget.dart';
import 'package:flutter_social_media_app/common_module/widgets/input_field_widgets.dart';
import 'package:flutter_social_media_app/posts_module/controller/post_controller.dart';
import 'package:flutter_social_media_app/posts_module/model/post_model.dart';
import 'package:get/get.dart';

class AddNewPostScreen extends StatelessWidget {
  AddNewPostScreen({super.key});

  final PostController postController = Get.find();

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _disController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Post'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: InputFieldWidget(
                  controller: _titleController,
                  labelText: "Title",
                  validator: (value) =>
                      value == null ? "Enter the title" : null,
                ),
              ),
              InputFieldWidget(
                controller: _disController,
                labelText: "Description",
                validator: (value) =>
                    value == null ? "Enter the description" : null,
              ),
              ButtonWidget(
                  onPressed: () async {
                    PostModel? recentlyAddedPost =
                        await postController.addNewPosts(
                      body: {
                        'title': _titleController.text,
                        'body': _disController.text,
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

                      _titleController.clear();
                      _disController.clear();
                    }
                  },
                  buttonTitle: 'Add Post'),
            ],
          ),
        ),
      ),
    );
  }
}
