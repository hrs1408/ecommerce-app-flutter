import 'package:flutter/material.dart';

class SearchInput extends StatelessWidget {
  final String hintText;
  final bool enabledInput;

  const SearchInput(
      {super.key, required this.hintText, required this.enabledInput});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.grey,
        ),
        enabled: enabledInput,
        suffixIconColor: Colors.grey,
        suffixIcon: const Icon(Icons.search),
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
    );
  }
}
