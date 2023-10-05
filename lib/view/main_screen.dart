import 'package:flutter/material.dart';
import 'package:flutter_social_media_app/controller/main_screen_controller.dart';
import 'package:flutter_social_media_app/posts_module/view/posts_screen.dart';
import 'package:flutter_social_media_app/to_do_module/view/to_do_screen.dart';
import 'package:flutter_social_media_app/users_module/view/users_screen.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final Controller mainScreenController = Get.put(Controller());

  final List<Widget> screens = [PostsScreen(), ToDoScreen(), UsersScreen()];

  void _onItemTapped(var index) {
    mainScreenController.updateIndex(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => screens[mainScreenController.index.value],
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.today), label: 'Todo'),
            BottomNavigationBarItem(icon: Icon(Icons.group), label: 'Users')
          ],
          currentIndex: mainScreenController.index.value,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
