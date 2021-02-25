import 'package:flutter/material.dart';

class DetailProduct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        children: [
          Image.asset('assets/images/object.png'),
          Text('Random Product'),
          Text('200.000d'),
        ],
      ),
    );
  }
}
