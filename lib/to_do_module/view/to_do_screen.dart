import 'package:flutter/material.dart';
import 'package:flutter_social_media_app/to_do_module/controller/to_do_controller.dart';
import 'package:get/get.dart';

class ToDoScreen extends StatelessWidget {
  ToDoScreen({super.key});

  final ToDoController toDoController = Get.put(ToDoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('My todos'),
      ),
      body: Obx(
        () => toDoController.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : toDoController.toDoLists.isNotEmpty
                ? ListView.builder(
                    itemCount: toDoController.toDoLists.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        leading: CircleAvatar(
                          child: Text('${index + 1}'),
                        ),
                        title: Text(toDoController.toDoLists[index].title),
                        trailing: toDoController.toDoLists[index].completed
                            ? const Icon(
                                Icons.check,
                                color: Colors.green,
                              )
                            : const Icon(
                                Icons.warning,
                                color: Colors.yellow,
                              ),
                      );
                    },
                  )
                : const Center(
                    child: Text('No any todos found'),
                  ),
      ),
    );
  }
}
