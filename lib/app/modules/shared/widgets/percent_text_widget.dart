import 'package:flutter/material.dart';

class PercentTextWidget extends StatelessWidget {
  const PercentTextWidget({
    Key key,
    @required this.value,
  }) : super(key: key);

  final double value;

  @override
  Widget build(BuildContext context) {
    return Text(
      '${value.abs().toStringAsFixed(2)}%',
      style: TextStyle(
        color: value > 0 ? Colors.green : Colors.red,
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
