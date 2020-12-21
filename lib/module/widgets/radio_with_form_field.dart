import 'package:flutter/material.dart';
import 'package:radio_validator/contants/app_colors.dart';

class RadioWithFormField extends FormField<bool> {
  RadioWithFormField({
    FormFieldSetter<bool> onSaved,
    FormFieldValidator<bool> validator,
    ValueChanged<bool> onChanged,
    String radioButtonText,
    bool initialValue = false,
    AutovalidateMode autovalidateMode,
  })  : assert(radioButtonText != null),
        super(
          onSaved: onSaved,
          initialValue: initialValue,
          validator: validator,
          autovalidateMode: AutovalidateMode.disabled,
          builder: (FormFieldState<bool> state) {
            print("initialValue $initialValue");

            return GestureDetector(
              onTap: () {
                state.didChange(state.value == !state.value);
                print("state.val: " + state.value.toString());
              },
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 20, right: 5),
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    width: 400.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                      color: AppColors.greyLight,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(radioButtonText),
                        // Checkbox(value: checkBoxValue, onChanged: null),
                        Stack(
                          children: [
                            Icon(
                              Icons.fiber_manual_record_rounded,
                              color: AppColors.white,
                              size: 42,
                            ),
                            state.value == true
                                ? Positioned(
                                    top: 10,
                                    left: 10,
                                    child: Icon(
                                      Icons.fiber_manual_record_rounded,
                                      color: AppColors.orange,
                                      size: 22,
                                    ),
                                  )
                                : Container(),
                          ],
                        ),
                      ],
                    ),
                  ),
                  state.value == false
                      ? Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Text(
                            state.errorText,
                            style: TextStyle(color: AppColors.red),
                          ),
                        )
                      : Container()
                ],
              ),
            );
          },
        );
}
