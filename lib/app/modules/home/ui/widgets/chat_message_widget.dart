import 'package:demo_stonks/app/base/app_dimens.dart';
import 'package:demo_stonks/app/modules/home/domain/models/message.dart';
import 'package:flutter/material.dart';

class ChatMessageWidget extends StatelessWidget {
  final Message message;

  ChatMessageWidget(this.message);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: kMarginDefault,
        vertical: kMarginSmall,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipOval(
            child: Image.asset(
              message.user.picture,
              height: 32.0,
              width: 32.0,
            ),
          ),
          SizedBox(width: kMarginDefault),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      message.user.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(width: kMarginDetail),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 1.0),
                      child: Text(
                        message.hour,
                        style: TextStyle(
                          color: Colors.black38,
                          fontSize: 10.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  message.text,
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 16.0,
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
