import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckBoxBankTransfer extends StatelessWidget {
  const CheckBoxBankTransfer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    void showAddBankAccountDialog() {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Thêm tài khoản ngân hàng',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  child: const Icon(Icons.close),
                )
              ],
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildTextField('Tên ngân hàng'),
                    buildTextField('Số tài khoản'),
                    buildTextField('Chủ tài khoản'),
                    buildTextField('Chi nhánh'),
                  ],
                )
              ],
            ),
            actions: <Widget>[
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0XFF3669C9),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text('Thêm',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w600)),
                ),
              ),
            ],
            titlePadding: const EdgeInsets.all(12),
            contentPadding: const EdgeInsets.all(10),
            actionsPadding: const EdgeInsets.all(10),
          );
        },
      );
    }

    RxBool checked = false.obs;
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
      child: Column(
        children: [
          Row(
            children: <Widget>[
              const Expanded(child: Text('Tài khoản ngân hàng')),
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
                      TextButton(
                          onPressed: () {
                            showAddBankAccountDialog();
                          },
                          child: const Text('Thêm tài khoản ngân hàng'))
                    ],
                  ),
                )
              : const SizedBox())
        ],
      ),
    );
  }

  Container buildTextField(String label) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: TextField(
        decoration: InputDecoration(
          hintText: label,
          hintStyle: const TextStyle(
            color: Colors.grey,
          ),
          filled: true,
          fillColor: const Color(0XFFEDEDED),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 16,
          ),
        ),
        enableSuggestions: false,
        autocorrect: false,
      ),
    );
  }
}
