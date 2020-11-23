import 'package:demo_stonks/app/base/app_dimens.dart';
import 'package:demo_stonks/app/modules/home/domain/models/portfolio.dart';
import 'package:demo_stonks/app/modules/home/ui/controllers/home_controller.dart';
import 'package:demo_stonks/app/modules/home/ui/widgets/home_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePortfolio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Modular.get<HomeController>();

    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kMarginDefault),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: kMarginDefault),
            Text(
              'Portfolio',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            SizedBox(height: kMarginSmall),
            ...controller.getPortfolio.map((e) => _PortfolioItem(e)).toList(),
            SizedBox(height: kMarginDefault),
          ],
        ),
      ),
    );
  }
}

class _PortfolioItem extends StatelessWidget {
  final Portfolio portfolio;

  const _PortfolioItem(this.portfolio);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kMarginDetail),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(kMarginSmall),
            child: Image.asset(
              portfolio.company.logo,
              height: 32.0,
              width: 32.0,
            ),
          ),
          SizedBox(width: kMarginSmall),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      portfolio.company.name,
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    SizedBox(width: kMarginDetail),
                    if (portfolio.unreadCount > 0)
                      UnreadWidget(portfolio.unreadCount),
                    if (portfolio.unreadCount == 0)
                      ClipOval(
                        child: Container(
                          height: 4,
                          width: 4,
                          color: Colors.blueAccent,
                        ),
                      ),
                    Spacer(),
                    _PercentValue(portfolio: portfolio),
                  ],
                ),
                SizedBox(height: kMarginDetail),
                Text(
                  portfolio.messages.last.text,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: portfolio.unreadCount > 0
                        ? FontWeight.w500
                        : FontWeight.normal,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _PercentValue extends StatelessWidget {
  const _PercentValue({
    Key key,
    @required this.portfolio,
  }) : super(key: key);

  final Portfolio portfolio;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: portfolio.percent > 0 ? Colors.green : Colors.red,
        borderRadius: BorderRadius.all(
          Radius.circular(4.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 2.0,
          horizontal: 4.0,
        ),
        child: Row(
          children: [
            Icon(
              portfolio.percent > 0 ? Icons.arrow_upward : Icons.arrow_downward,
              size: 16,
              color: Colors.white,
            ),
            Text(
              '${portfolio.percent.toStringAsFixed(1)}%',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
