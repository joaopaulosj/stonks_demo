import 'package:flutter/material.dart';

class ArrowIconWidget extends StatelessWidget {
  const ArrowIconWidget({
    Key key,
    @required this.value,
  }) : super(key: key);

  final double value;

  @override
  Widget build(BuildContext context) {
    return Icon(
      value > 0 ? Icons.arrow_upward : Icons.arrow_downward,
      size: 20.0,
      color: value > 0 ? Colors.green : Colors.red,
    );
  }
}
