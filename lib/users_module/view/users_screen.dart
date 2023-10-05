import 'package:flutter/material.dart';
import 'package:flutter_social_media_app/users_module/controller/users_controller.dart';
import 'package:get/get.dart';

class UsersScreen extends StatelessWidget {
  UsersScreen({super.key});

  final UsersController userController = Get.put(UsersController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('All Users'),
      ),
      body: Obx(
        () => userController.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: userController.usersLists.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                          child: Text(
                        '${index + 1}',
                      )),
                      title: Text(
                        userController.usersLists[index].name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              'User Name: ${userController.usersLists[index].username}'),
                          Text(
                              'Email: ${userController.usersLists[index].email}'),
                          Text(
                              'Address: ${userController.usersLists[index].address.city}'),
                          Text(
                              'Phone Number: ${userController.usersLists[index].phone}'),
                          Text(
                              'Company Name: ${userController.usersLists[index].company.name}'),
                          Text(
                              'Website: ${userController.usersLists[index].website}'),
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
