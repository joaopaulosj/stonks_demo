import 'dart:math';

import 'package:demo_stonks/app/base/app_dimens.dart';
import 'package:demo_stonks/app/base/app_strings.dart';
import 'package:demo_stonks/app/modules/home/domain/models/portfolio.dart';
import 'package:demo_stonks/app/modules/home/ui/widgets/chat_message_widget.dart';
import 'package:demo_stonks/app/modules/shared/widgets/arrow_icon_widget.dart';
import 'package:demo_stonks/app/modules/shared/widgets/percent_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
  var _showWarning = Random().nextInt(2) == 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        brightness: Brightness.light,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 1.0,
        centerTitle: false,
        bottom: _showWarning
            ? PreferredSize(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _showWarning = false;
                    });
                  },
                  child: Container(
                    color: Colors.red,
                    height: 40.0,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: kMarginSmall,
                        ),
                        child: Text(
                          AppStrings.chatWarning,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                preferredSize: Size.fromHeight(40.0),
              )
            : null,
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
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              reverse: true,
              itemCount: widget.portfolio.messages.length,
              itemBuilder: (_, index) {
                final message =
                    widget.portfolio.messages.reversed.toList()[index];
                return ChatMessageWidget(message);
              },
              separatorBuilder: (_, index) {
                if (index == widget.portfolio.unreadCount - 1) {
                  return _UnreadSeparator();
                } else {
                  return SizedBox.shrink();
                }
              },
            ),
          ),
          _TextField(),
        ],
      ),
    );
  }
}

class _UnreadSeparator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kMarginSmall),
      child: Row(
        children: [
          SizedBox(width: kMarginDefault),
          Expanded(
            child: Container(
              height: 1,
              color: Colors.red.withOpacity(0.2),
            ),
          ),
          SizedBox(width: kMarginDefault),
          Text(
            AppStrings.chatUnread,
            style: TextStyle(color: Colors.red),
          ),
          SizedBox(width: kMarginDefault),
          Expanded(
            child: Container(
              height: 1,
              color: Colors.red.withOpacity(0.2),
            ),
          ),
          SizedBox(width: kMarginDefault),
        ],
      ),
    );
  }
}

class _TextField extends StatelessWidget {
  const _TextField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(color: Colors.black.withOpacity(0.05), height: 1),
        Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: AppStrings.chatFieldHint,
                  alignLabelWithHint: true,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: kMarginDefault,
                    vertical: kMarginSmall,
                  ),
                  labelStyle: TextStyle(
                    color: Theme.of(context)
                        .textTheme
                        .bodyText1
                        .color
                        .withOpacity(0.7),
                    fontWeight: FontWeight.normal,
                  ),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(kMarginDefault),
              child: Icon(
                Icons.open_in_full_outlined,
                size: 16,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(kMarginDefault),
          child: Row(
            children: [
              SvgPicture.asset(
                'assets/icons/ic_mention.svg',
                height: 24.0,
                width: 24.0,
                color: Colors.black87,
              ),
              SizedBox(width: 24.0),
              SvgPicture.asset(
                'assets/icons/ic_gallery.svg',
                height: 24.0,
                width: 24.0,
                color: Colors.black87,
              ),
              SizedBox(width: 24.0),
              SvgPicture.asset(
                'assets/icons/ic_gif.svg',
                height: 24.0,
                width: 24.0,
                color: Colors.black87,
              ),
              Spacer(),
              Icon(Icons.send),
            ],
          ),
        )
      ],
    );
  }
}
