import 'package:flutter/material.dart';
import 'package:radio_validator/contants/app_colors.dart';

class CustomRadioButton extends FormField<String> {
  CustomRadioButton({
    String initialValue = "",
    // String radioButtonText,
    FormFieldSetter<String> onSaved,
    FormFieldValidator<String> validator,
  }) : super(
            autovalidateMode: AutovalidateMode.disabled,
            onSaved: onSaved,
            validator: validator,
            initialValue: initialValue ?? "",
            builder: (state) {
              return CustomRadioButtonState(
                state: state,
                // radioButtonText: radioButtonText,
              );
            });
}

class CustomRadioButtonState extends StatefulWidget {
  final String radioButtonText;
  final FormFieldState<String> state;
  CustomRadioButtonState({
    this.state,
    this.radioButtonText,
  });

  @override
  _CustomRadioButtonStateState createState() => _CustomRadioButtonStateState();
}

class _CustomRadioButtonStateState extends State<CustomRadioButtonState> {
  bool _selected;

  @override
  void initState() {
    _selected = false;
    // print("radioButtonText ${widget.radioButtonText}");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selected = !_selected;
        });
        if (_selected) {}
      },
      child: Container(
        padding: const EdgeInsets.only(left: 20, right: 5),
        margin: const EdgeInsets.symmetric(horizontal: 8),
        width: 400.0,
        height: 60.0,
        decoration: BoxDecoration(
          color: AppColors.greyLight,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.radioButtonText != null
                    ? widget.radioButtonText
                    : "Write your text"),
                // Checkbox(value: checkBoxValue, onChanged: null),
                Stack(
                  children: [
                    Icon(
                      Icons.fiber_manual_record_rounded,
                      color: AppColors.white,
                      size: 42,
                    ),
                    _selected
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
            _selected == false
                ? Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text(
                      widget.state.errorText,
                      style: TextStyle(color: AppColors.red),
                    ),
                  )
                : Container()
          ],
        ),
      ),
    ); //The Widget(s) to build your form field
  }
}
