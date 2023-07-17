import 'package:ecommerces/widgets/credit_card_check.dart';
import 'package:flutter/material.dart';

import '../../widgets/bank_transfer_check.dart';

class CheckoutStepTwoScreen extends StatelessWidget {
  const CheckoutStepTwoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Column(
        children: [
          Container(
            height: 50,
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5,
                  offset: Offset(0, 0),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
                const Text(
                  'Phương thức thanh toán',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Badge(
                    label: const Text('5'),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/cart');
                      },
                      child: const Icon(Icons.shopping_cart_outlined),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height - 158,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              width:
                                  MediaQuery.of(context).size.width / 2 - 22.5,
                              height: 5,
                              decoration: const BoxDecoration(
                                  color: Colors.black,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Container(
                              width:
                                  MediaQuery.of(context).size.width / 2 - 22.5,
                              height: 5,
                              decoration: const BoxDecoration(
                                  color: Colors.black,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const CheckBoxBankTransfer(),
                        const CreditCartCheckbox(),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                          child: Row(
                            children: <Widget>[
                              const Expanded(
                                  child: Text('Thanh toán khi nhận hàng')),
                              Checkbox(
                                activeColor: Colors.black,
                                value: false,
                                onChanged: (bool? newValue) {},
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      )),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            width: 150,
            height: 50,
            decoration: BoxDecoration(
              color: const Color(0XFF3669C9),
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/order_success');
              },
              child: const Text(
                'Hoàn tất',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
