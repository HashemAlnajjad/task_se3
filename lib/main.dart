import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_se3/bindings/user_bindings.dart';
import 'package:task_se3/screens/users_list.dart';

// main function and MyApp class by محمد غسان حمود
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(primarySwatch: Colors.grey),
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      initialBinding: UserBindings(),
      getPages: [
        GetPage(
            name: "/", page: () => const UsersList(), binding: UserBindings())
      ],
    );
  }
}
