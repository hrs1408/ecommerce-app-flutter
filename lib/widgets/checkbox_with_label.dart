import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckBox extends StatelessWidget {
  final String label;

  const CheckBox({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    RxBool valueCheckBox = false.obs;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label),
        Checkbox(
          overlayColor: MaterialStateProperty.all(Colors.grey.withOpacity(0.2)),
          activeColor: Colors.black,
          value: valueCheckBox.value,
          onChanged: (newValue) {
            valueCheckBox = newValue!.obs;
          },
        ),
      ],
    );
  }
}
