import 'package:demo_stonks/app/app_dimens.dart';
import 'package:flutter/material.dart';

import '../../../../app_strings.dart';

class HomeBalanceHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(kMarginDefault),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.homeTodayTitle,
                  style: TextStyle(
                    color: Colors.black38,
                    fontSize: 12.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Row(
                  children: [
                    Icon(Icons.arrow_upward, size: 20.0, color: Colors.green),
                    SizedBox(width: 4.0),
                    Text(
                      '25.4%',
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                )
              ],
            ),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.homeTotalPercentTitle,
                  style: TextStyle(
                    color: Colors.black38,
                    fontSize: 12.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Row(
                  children: [
                    Icon(Icons.arrow_upward, size: 20.0, color: Colors.green),
                    SizedBox(width: 4.0),
                    Text(
                      '25.4%',
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                )
              ],
            ),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.homeTotalValueTitle,
                  style: TextStyle(
                    color: Colors.black38,
                    fontSize: 12.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  '\$345,904',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
