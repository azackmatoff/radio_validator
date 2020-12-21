import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radio_validator/contants/app_colors.dart';
import 'package:radio_validator/controllers/custom_radio_controller.dart';
import 'package:radio_validator/models/model.dart';
import 'package:radio_validator/module/widgets/custom_radio_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _radioController = Get.find<CustomRadioController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 40),
            CustomRadioWidget(
              model: [
                Model(buttonText: "Woman", selected: false),
                Model(buttonText: "Man", selected: false)
              ],
            ),
            SizedBox(height: 60),
            // RadioWithFormField(
            //   radioButtonText: "Woman",
            // ),
            GestureDetector(
              onTap: () {
                if (_radioController.modelList
                        .any((element) => element.selected == true) ==
                    false) {
                  _radioController.updateNotSelected(true);
                } else {
                  _radioController.updateNotSelected(false);
                  Get.snackbar(
                      "SUCCESS!", "Successfully will go to the next page");
                }
              },
              child: Container(
                width: 200.0,
                height: 60.0,
                decoration: BoxDecoration(
                  color: AppColors.orange,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                    child: Text(
                  "NEXT",
                  style: TextStyle(color: AppColors.white),
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
