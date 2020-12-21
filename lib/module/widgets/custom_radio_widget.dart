import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radio_validator/contants/app_colors.dart';
import 'package:radio_validator/controllers/custom_radio_controller.dart';
import 'package:radio_validator/models/model.dart';

class CustomRadioWidget extends StatefulWidget {
  final List<Model> model;
  const CustomRadioWidget({
    Key key,
    this.model,
  }) : super(key: key);
  @override
  _CustomRadioWidgetState createState() => _CustomRadioWidgetState();
}

class _CustomRadioWidgetState extends State<CustomRadioWidget> {
  final _radioController = Get.find<CustomRadioController>();
  bool _selected = false;

  @override
  void initState() {
    super.initState();
    _radioController.setModelList(widget.model);
  }

  void updateSelected() {
    setState(() {
      _selected = !_selected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: _radioController.modelList.length,
            itemBuilder: (context, index) => Container(
              padding: const EdgeInsets.only(
                left: 20,
                right: 5,
              ),
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
              width: 400.0,
              height: 60.0,
              decoration: BoxDecoration(
                color: _radioController.modelList[index].selected
                    ? AppColors.greenLighter
                    : AppColors.greyLight,
                borderRadius: BorderRadius.circular(10),
              ),
              child: GestureDetector(
                onTap: () {
                  updateSelected();
                  _radioController.updateModelSelected(index, _selected);
                  if (_selected) {
                    _radioController.updateNotSelected(false);
                  } else {
                    _radioController.updateNotSelected(true);
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(_radioController.modelList[index].buttonText),
                    Stack(
                      children: [
                        Icon(
                          Icons.fiber_manual_record_rounded,
                          color: AppColors.white,
                          size: 42,
                        ),
                        _radioController.modelList[index].selected
                            ? Positioned(
                                top: 10,
                                left: 10,
                                child: Icon(
                                  Icons.fiber_manual_record_rounded,
                                  color: AppColors.orange,
                                  size: 22,
                                ),
                              )
                            : SizedBox(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          _radioController.notSelected.value
              ? Text(
                  "Please select an item",
                  style: TextStyle(color: AppColors.red),
                )
              : Container(),
        ],
      ),
    );
  }
}
