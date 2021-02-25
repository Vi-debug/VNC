import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PhoneTextField extends StatefulWidget {
  final TextEditingController controller;

  const PhoneTextField({Key key, this.controller}) : super(key: key);
  @override
  _PhoneTextFieldState createState() => _PhoneTextFieldState();
}

class _PhoneTextFieldState extends State<PhoneTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: TextFormField(
          validator: (value) {
            if (value.length < 10) return 'Wrong phone number';
            return null;
          },
          controller: widget.controller,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(10)
          ],
          keyboardType: TextInputType.phone,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            hintText: 'Nhập số điện thoại',
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2.0),
              borderRadius: BorderRadius.circular(5),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2.0),
              borderRadius: BorderRadius.circular(5),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2.0),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ));
  }
}
