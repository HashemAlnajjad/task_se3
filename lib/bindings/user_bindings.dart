import 'package:get/get.dart';
import 'package:task_se3/controllers/users_controller.dart';

// UserBindings by محمد كريم أحمد
class UserBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<UserController>(UserController());
  }
}
