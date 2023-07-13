import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';

class EnterInfo extends StatelessWidget {
  const EnterInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final passwordState = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Thông tin cá nhân',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Vui lòng nhập dữ liệu để đăng ký tài khoản',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Tên đầy đủ',
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'Tên đầy đủ',
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
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Mật khẩu mới',
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextField(
                          controller: passwordState,
                          decoration: InputDecoration(
                            hintText: 'Mật khẩu mới',
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
                          autofillHints: const [AutofillHints.email],
                          keyboardType: TextInputType.emailAddress,
                          enableSuggestions: false,
                          autocorrect: false,
                          obscureText: true,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        FlutterPwValidator(
                            controller: passwordState,
                            minLength: 6,
                            uppercaseCharCount: 2,
                            lowercaseCharCount: 2,
                            numericCharCount: 3,
                            specialCharCount: 1,
                            width: 400,
                            height: 140,
                            onSuccess: () {
                              if (kDebugMode) {
                                print('Thành công');
                              }
                            },
                            onFail: () {
                              if (kDebugMode) {
                                print('Thất bại');
                              }
                            })
                      ],
                    ),
                    const SizedBox(
                      height: 90,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0XFF3669C9),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text('Xác nhận'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
