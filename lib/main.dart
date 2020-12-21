import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radio_validator/controllers/custom_radio_controller.dart';
import 'package:radio_validator/module/screens/home_screen.dart';

void main() {
  CustomRadioController _radioController = Get.put(CustomRadioController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Radio Validator',
      home: HomeScreen(),
    );
  }
}
