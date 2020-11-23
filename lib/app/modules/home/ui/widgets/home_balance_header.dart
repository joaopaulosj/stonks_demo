import 'package:demo_stonks/app/base/app_dimens.dart';
import 'package:demo_stonks/app/base/app_strings.dart';
import 'package:demo_stonks/app/modules/home/ui/controllers/home_controller.dart';
import 'package:demo_stonks/app/modules/shared/widgets/arrow_icon_widget.dart';
import 'package:demo_stonks/app/modules/shared/widgets/percent_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';

class HomeBalanceHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Modular.get<HomeController>();
    final formatCurrency = NumberFormat.simpleCurrency(decimalDigits: 0);

    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(kMarginDefault),
        child: Observer(
          builder: (context) {
            final state = controller.balanceState;
            if (state is BalanceState) {
              return Row(
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
                          ArrowIconWidget(value: state.balance.todayPercent),
                          SizedBox(width: 4.0),
                          PercentTextWidget(value: state.balance.todayPercent),
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
                          ArrowIconWidget(value: state.balance.totalPercent),
                          SizedBox(width: 4.0),
                          PercentTextWidget(value: state.balance.totalPercent),
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
                        '${formatCurrency.format(state.balance.totalValueDiff.floor())}',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  Spacer(flex: 2),
                ],
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
