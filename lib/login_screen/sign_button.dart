import 'package:flutter/material.dart';

class SignButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color backgroundColor;

  final Function func;

  const SignButton(
      {Key key, this.text, this.backgroundColor, this.textColor, this.func})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: Colors.black,
              width: 2,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              text,
              style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        onTap: func,
      ),
    );
  }
}
