import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:madeincameroon/chat/data/Message.dart';

import '../../../shared/utils/appColor.dart';
import '../../../shared/utils/dimens.dart';

class MessageCardView extends StatelessWidget {
  MessageCardView({super.key, required this.message, this.isSend = false});

  Message message;
  bool isSend;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Align(
        alignment: isSend ? Alignment.topRight : Alignment.topLeft,
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: isSend
                  ? BorderRadius.only(
                      topLeft: Radius.circular(16.0),
                      bottomLeft: Radius.circular(16.0),
                      bottomRight: Radius.circular(16.0))
                  : BorderRadius.only(
                      topRight: Radius.circular(16.0),
                      bottomLeft: Radius.circular(16.0),
                      bottomRight: Radius.circular(16.0)),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.1, 1],
                colors: isSend
                    ? [Color(0xFF00CB6D), colorPrimary]
                    : [colorGreyLight, colorGreyLight],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 16.0, right: 16.0, bottom: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    message.text,
                    style: TextStyle(
                        color: isSend ? Colors.white : colorBgBlack,
                        fontWeight: FontWeight.w500, fontSize: smallTextSize),
                  ),
                  SizedBox(height: 16.0,),
                  Text(
                    formatDate(message.dateSend),
                    style: TextStyle(
                        color: isSend ? Colors.white : colorBgBlack,
                        fontWeight: FontWeight.w500, fontSize: extraSmallTextSize),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  String formatDate(DateTime dateTime){

    return  DateFormat('dd/MM/yyyy HH:mm').format(dateTime);
  }
}
