import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_se3/controllers/users_controller.dart';

// UsersList class by أحمد مصطفى حمدو
class UsersList extends GetView<UserController> {
  const UsersList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.white60,
        title: const Text("SE3 Task"),
        actions: [
          IconButton(
              onPressed: () {
                controller.reset();
              },
              icon: const Icon(Icons.refresh))
        ],
      ),
      // Obx and listView by علي عماد الأحمد
      body: Obx(() => (controller.isLoaded.value)
          ? ListView(
              children: List.generate(
                  15,
                  (index) => Container(
                        margin: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.white60,
                            borderRadius: BorderRadius.circular(15)),
                        child: ListTile(
                          leading: controller.image[index],
                          title: Text(controller.name[index]),
                          subtitle: Text(controller.email[index]),
                          trailing: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(controller.city[index]),
                              Text(controller.date[index]),
                            ],
                          ),
                        ),
                      )))
          : Center(
              child: ElevatedButton(
                  onPressed: () async {
                    await controller.getUsers();
                  },
                  child: const Text("press to load random users")),
            )),
    );
  }
}
