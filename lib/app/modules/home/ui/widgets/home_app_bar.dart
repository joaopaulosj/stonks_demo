import 'package:demo_stonks/app/app_dimens.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../app_strings.dart';

class HomeAppBar extends StatelessWidget {
  final tempValue = 1030991.86;
  final formatCurrency = NumberFormat.simpleCurrency(decimalDigits: 0);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(kMarginDefault),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.homeGreeting('Joe'),
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: kMarginDetail),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '${formatCurrency.format(tempValue.floor())}',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: '.${(tempValue * 100).toInt() % 100}',
                          style: TextStyle(
                            color: Colors.black38,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            ClipOval(
              child: Image.asset(
                'assets/avatars/avatar_8.jpg',
                height: 32.0,
                width: 32.0,
              ),
            )
          ],
        ),
      ),
    );
  }
}
