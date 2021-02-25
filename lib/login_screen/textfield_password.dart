import 'package:flutter/material.dart';

class PasswordTextField extends StatelessWidget {
  final TextEditingController controller;

  const PasswordTextField({Key key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: TextFormField(
          controller: controller,
          keyboardType: TextInputType.name,
          textAlign: TextAlign.center,
          obscureText: true,
          decoration: InputDecoration(
            hintText: 'Nhập mật khẩu',
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2.0),
              borderRadius: BorderRadius.circular(5),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2.0),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ));
  }
}
