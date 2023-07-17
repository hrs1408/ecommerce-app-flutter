import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckBoxBankTransfer extends StatelessWidget {
  const CheckBoxBankTransfer({
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
              const Expanded(child: Text('Chuyển khoản ngân hàng')),
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
              ? Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 200,
                                child: Row(
                                  children: [
                                    Icon(Icons.account_balance_wallet_outlined),
                                    SizedBox(width: 8),
                                    Expanded(
                                      child: Text(
                                          'Ngân hàng TMCP Ngoại Thương Việt Nam',
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(height: 8),
                              Row(
                                children: [
                                  Icon(Icons.person),
                                  SizedBox(width: 8),
                                  Text('Nguyễn Văn An')
                                ],
                              ),
                            ],
                          ),
                          const Spacer(),
                          Transform(
                              transform: Transform.scale(scale: 0.8).transform,
                              child: Checkbox(
                                  activeColor: Colors.black,
                                  value: true,
                                  onChanged: (bool? newValue) {}))
                        ],
                      ),
                      const Divider(),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 200,
                                child: Row(
                                  children: [
                                    Icon(Icons.account_balance_wallet_outlined),
                                    SizedBox(width: 8),
                                    Expanded(
                                      child: Text('Ngân hàng Phát triển TP.HCM',
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(height: 8),
                              Row(
                                children: [
                                  Icon(Icons.person),
                                  SizedBox(width: 8),
                                  Text('Nguyễn Văn An')
                                ],
                              ),
                            ],
                          ),
                          const Spacer(),
                          Transform(
                              transform: Transform.scale(scale: 0.8).transform,
                              child: Checkbox(
                                  activeColor: Colors.black,
                                  value: false,
                                  onChanged: (bool? newValue) {}))
                        ],
                      ),
                      const Divider(),
                      TextButton(onPressed: (){}, child: const Text('Thêm tài khoản ngân hàng'))
                    ],
                  ),
                )
              : const SizedBox())
        ],
      ),
    );
  }
}
