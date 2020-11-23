import 'package:demo_stonks/app/base/app_dimens.dart';
import 'package:demo_stonks/app/base/app_strings.dart';
import 'package:demo_stonks/app/modules/home/domain/models/portfolio.dart';
import 'package:demo_stonks/app/modules/shared/widgets/arrow_icon_widget.dart';
import 'package:demo_stonks/app/modules/shared/widgets/percent_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChatPage extends StatefulWidget {
  static const routeName = '/chat';

  final Portfolio portfolio;

  ChatPage(this.portfolio);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final _formatCurrency = NumberFormat.simpleCurrency(decimalDigits: 2);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        brightness: Brightness.light,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 1.0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  widget.portfolio.company.name,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: kMarginDetail),
                Icon(Icons.info_outline, size: 16),
              ],
            ),
            SizedBox(height: kMarginDetail),
            Text(
              AppStrings.chatMembersText(widget.portfolio.membersCount),
              style: TextStyle(
                color: Colors.black38,
                fontSize: 14.0,
              ),
            ),
          ],
        ),
        actions: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: kMarginSmall),
                  Text(
                    _formatCurrency.format(widget.portfolio.balance),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: kMarginDetail),
                  Row(
                    children: [
                      ArrowIconWidget(value: widget.portfolio.percent),
                      SizedBox(width: 4.0),
                      PercentTextWidget(value: widget.portfolio.percent),
                    ],
                  )
                ],
              ),
              SizedBox(width: kMarginSmall),
              Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.all(
                    Radius.circular(50),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: kMarginSmall,
                    horizontal: kMarginDefault,
                  ),
                  child: Text(
                    AppStrings.chatTradeButton,
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
              ),
              SizedBox(width: kMarginDefault),
            ],
          ),
        ],
      ),
      body: Center(),
    );
  }
}
