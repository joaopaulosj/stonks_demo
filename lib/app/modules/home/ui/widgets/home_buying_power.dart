import 'package:demo_stonks/app/base/app_dimens.dart';
import 'package:demo_stonks/app/base/app_strings.dart';
import 'package:demo_stonks/app/modules/home/ui/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';

class HomeBuyingPower extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Modular.get<HomeController>();
    final _formatCurrency = NumberFormat.simpleCurrency(decimalDigits: 0);

    return SliverToBoxAdapter(
      child: Observer(
        builder: (context) {
          final state = controller.balanceState;

          if (state is BalanceState) {
            return Column(
              children: [
                Divider(),
                InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: kMarginSmall,
                      horizontal: kMarginDefault,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(AppStrings.homeBuyingPowerTitle),
                        Spacer(),
                        Text(
                          _formatCurrency.format(state.balance.buyingPower),
                          style: TextStyle(fontSize: 14.0),
                        ),
                        Icon(Icons.chevron_right),
                      ],
                    ),
                  ),
                )
              ],
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
