import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class UserController extends GetxController {
  // userController to initialize the variables and declare variables by أحمد محمود طياسنة
  UserController() {
    name = List.generate(15, (index) => "null");
    city = List.generate(15, (index) => "null");
    date = List.generate(15, (index) => "null");
    email = List.generate(15, (index) => "null");
    image = List.generate(15, (index) => const Icon(Icons.accessibility_new));
    index = 0;
  }

  late List<String> name;
  late List<String> city;
  late List<String> date;
  late List<String> email;
  late List image;
  late int index;
  RxBool isLoaded = RxBool(false);

  // reset function by عمر محمد هلال
  void reset() {
    name = List.generate(15, (index) => "null");
    city = List.generate(15, (index) => "null");
    date = List.generate(15, (index) => "null");
    email = List.generate(15, (index) => "null");
    image = List.generate(15, (index) => const Icon(Icons.accessibility_new));
    index = 0;
    isLoaded.value = false;
  }

  // getUsers function to get random users by هاشم وسيم النجاد
  Future<void> getUsers() async {
    while (index < 15) {
      Uri url = Uri(
        scheme: "https",
        host: "random-data-api.com",
        path: "/api/users/random_user",
        port: 443,
      );
      http.Response r = await http.get(url);
      if (r.statusCode == 200) {
        var data = jsonDecode(r.body);
        // print(data);
        name[index] = (data["first_name"] + " " + data["last_name"]);
        city[index] = (data["address"]["city"]);
        date[index] = (data["date_of_birth"]);
        email[index] = (data["email"]);
        image[index] = (Image.network(data["avatar"]));
        index++;
      }
    }
    isLoaded.value = true;
  }
}
