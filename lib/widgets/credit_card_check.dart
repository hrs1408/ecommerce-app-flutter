import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:get/get.dart';

class CreditCartCheckbox extends StatelessWidget {
  const CreditCartCheckbox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    RxBool checked = false.obs;
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
      child: Column(
        children: [
          Row(
            children: <Widget>[
              const Expanded(child: Text('Thẻ tín dụng')),
              Obx(
                () => Checkbox(
                  activeColor: Colors.black,
                  value: checked.value,
                  onChanged: (bool? newValue) {
                    checked.value = newValue!;
                  },
                ),
              )
            ],
          ),
          const Divider(),
          Obx(() => checked.value
              ? Column(
                  children: [
                    Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Row(
                              children: [
                                Icon(Icons.credit_card_outlined),
                                SizedBox(width: 8),
                                Text('Vietcombank')
                              ],
                            ),
                            Transform(
                                transform: Transform.scale(scale: 0.8).transform,
                                child: Checkbox(
                                    activeColor: Colors.black,
                                    value: true,
                                    onChanged: (bool? newValue) {}))
                          ],
                        ),
                        CreditCardWidget(
                          height: 160,
                          bankName: 'Vietcombank',
                          cardNumber: '5450 7879 4864 7854',
                          expiryDate: '10/25',
                          cardHolderName: 'Nguyễn Văn An',
                          cvvCode: '456',
                          showBackView: false,
                          onCreditCardWidgetChange: (CreditCardBrand) {},
                        ),
                        const Divider(),
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Row(
                              children: [
                                Icon(Icons.credit_card_outlined),
                                SizedBox(width: 8),
                                Text('HDBank')
                              ],
                            ),
                            Transform(
                                transform: Transform.scale(scale: 0.8).transform,
                                child: Checkbox(
                                    activeColor: Colors.black,
                                    value: false,
                                    onChanged: (bool? newValue) {}))
                          ],
                        ),
                        CreditCardWidget(
                          height: 160,
                          bankName: 'HDBank',
                          cardNumber: '5450 7879 4864 7854',
                          expiryDate: '10/24',
                          cardHolderName: 'Nguyễn Văn An',
                          cvvCode: '456',
                          showBackView: false,
                          onCreditCardWidgetChange: (CreditCardBrand) {},
                        ),
                        const Divider(),
                      ],
                    ),
                    TextButton(onPressed: (){}, child: const Text('Thêm thẻ mới'))
                  ],
                )
              : const SizedBox())
        ],
      ),
    );
  }
}
