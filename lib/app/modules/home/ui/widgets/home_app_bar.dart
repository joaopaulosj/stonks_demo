import 'package:demo_stonks/app/base/app_dimens.dart';
import 'package:demo_stonks/app/base/app_strings.dart';
import 'package:demo_stonks/app/modules/home/ui/controllers/home_controller.dart';
import 'package:demo_stonks/app/utils/sliver_pinned_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';

class HomeAppBar extends StatelessWidget {
  final _formatCurrency = NumberFormat.simpleCurrency(decimalDigits: 0);

  @override
  Widget build(BuildContext context) {
    final controller = Modular.get<HomeController>();

    return SliverPinnedBox(
      child: Container(
        color: Theme.of(context).backgroundColor,
        child: Padding(
          padding: const EdgeInsets.all(kMarginDefault),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Observer(builder: (context) {
                      final state = controller.userState;
                      if (state is UserState) {
                        return Text(
                          AppStrings.homeGreeting(state.user.name),
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w400,
                          ),
                        );
                      } else {
                        return Container();
                      }
                    }),
                    SizedBox(height: kMarginDetail),
                    Observer(builder: (context) {
                      final state = controller.balanceState;

                      if (state is BalanceState) {
                        final value = (state.balance.value * 100).toInt() % 100;

                        return RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: '${_formatCurrency.format(
                                  state.balance.value.floor(),
                                )}',
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: '.${value < 10 ? '0' : ''}$value',
                                style: TextStyle(
                                  color: Colors.black38,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        );
                      } else {
                        return Container();
                      }
                    }),
                  ],
                ),
              ),
              Observer(builder: (context) {
                final state = controller.userState;
                if (state is UserState) {
                  return ClipOval(
                    child: Image.asset(
                      state.user.picture,
                      height: 32.0,
                      width: 32.0,
                    ),
                  );
                } else {
                  return Container();
                }
              })
            ],
          ),
        ),
      ),
    );
  }
}
