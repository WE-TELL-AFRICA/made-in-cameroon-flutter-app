import 'package:flutter/material.dart';
import 'package:madeincameroon/chat/data/Message.dart';
import 'package:madeincameroon/chat/presentation/views/message_card_view.dart';
import 'package:madeincameroon/shared/presentation/views/app_bar_main.dart';
import 'package:madeincameroon/shared/utils/appColor.dart';
import 'package:madeincameroon/shared/utils/dimens.dart';

class ChatPageScreen extends StatelessWidget {
  ChatPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/background.png"),
                  fit: BoxFit.cover)),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              ListView(
                children: [
                  AppBarMain(title: "Chat"),
                  SizedBox(
                    height: 16.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      children: [
                        MessageCardView(
                            message: Message(
                                id: 1,
                                idReceiver: 1,
                                idSender: 1,
                                text:
                                    "Hello Mr I want to buy some banana... Please I can have this really right now, this is my favorite fruit to eating ",
                                dateSend: DateTime.now())),
                        MessageCardView(
                            isSend: true,
                            message: Message(
                                id: 1,
                                idReceiver: 1,
                                idSender: 1,
                                text:
                                    "Hello Mr I want to buy some banana... Please I can have this really right now, this is my favorite fruit to eating ",
                                dateSend: DateTime.now())),
                      ],
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: colorPrimary,
                            borderRadius: BorderRadius.circular(8.0)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.close,
                            color: Colors.white,
                            size: smallSizeIcon,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 8.0,
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              color: colorGreyLight,
                              borderRadius: BorderRadius.circular(16.0)),
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: SingleChildScrollView(
                              child: TextField(
                                  maxLines: null,
                                  textInputAction: TextInputAction.send,
                                  style: TextStyle(fontSize: defaultTextSize),
                                  decoration: InputDecoration(
                                    hintText: "Search",
                                    border: InputBorder.none,
                                  ),
                                  keyboardType: TextInputType.multiline),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 8.0,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: colorPrimary, shape: BoxShape.circle),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.send,
                            color: Colors.white,
                            size: smallSizeIcon,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
