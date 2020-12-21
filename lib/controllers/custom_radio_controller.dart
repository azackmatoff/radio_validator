import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:radio_validator/models/model.dart';

class CustomRadioController extends GetxController {
  var modelList = List<Model>().obs;
  var notSelected = false.obs;

  @override
  void onInit() {
    debugPrint("notSelected onInit: " + notSelected.value.toString());
    super.onInit();
  }

  void setModelList(List<Model> items) {
    modelList.assignAll(items);
    update();
  }

  void updateModelSelected(int index, bool bool) {
    modelList.elementAt(index).selected = bool;
    updateNotSelected(bool);
    debugPrint("modelList.elementAt(index).selected: " +
        modelList.elementAt(index).selected.toString());
    update();
  }

  void updateNotSelected(bool bool) {
    notSelected.value = bool;
    debugPrint("updateNotSelected: " + notSelected.value.toString());
    update();
  }
}
