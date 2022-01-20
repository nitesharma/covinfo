import 'package:covinfo/utils/const.dart';
import 'package:flutter/material.dart';

class Health extends StatelessWidget {
  const Health({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          'Health',
          style: TextStyle(color: kText),
        ),
      ),
    );
  }
}
