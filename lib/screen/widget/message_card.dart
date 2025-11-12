import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chat_bot/models/message.dart';
import 'package:flutter/material.dart';

import '../../helper/global.dart';

class MessageCard extends StatelessWidget {
  final Message message;
  const MessageCard({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.sizeOf(context);
    return message.messageType==MessageType.bot?Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            child: Image.asset('assets/images/ai-2.png'),
          ),
          SizedBox(width: 5,),
          Container(
              constraints: BoxConstraints(maxWidth: mq.width*.6),
              margin: EdgeInsets.only(bottom:mq.height*.02,left: mq.width*.02),
              padding: EdgeInsets.symmetric(
                vertical: mq.height*.01,horizontal:mq.width*.02,
              ),
              decoration: BoxDecoration(
                  color: Colors.blue,
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15),bottomRight: Radius.circular(15))
              ),
               child:message.msg.isEmpty?AnimatedTextKit(
                 animatedTexts: [
                   TypewriterAnimatedText(textStyle:TextStyle(color: Colors.white),'searching....',speed: Duration(milliseconds: 100)),

                 ],repeatForever: true,
               ):  Text(
             message.msg,style:TextStyle(color: Colors.white),
               textAlign: TextAlign.center,),
          ),
        ],
      ),
    ) :
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end ,
        children: [
          SizedBox(width: 5,),
          Container(
            constraints: BoxConstraints(maxWidth: mq.width*.6),
              margin: EdgeInsets.only(bottom:mq.height*.02,right: mq.width*.02),
              padding: EdgeInsets.symmetric(
                vertical: mq.height*.01,horizontal:mq.width*.02,
              ),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15),bottomLeft: Radius.circular(15))
              ),
              child: Text(message.msg,textAlign: TextAlign.center,)),
          CircleAvatar(
            backgroundColor: Colors.white,
            child: Image.asset('assets/images/boy.png'),
          ),
        ],
      ),

    );
  }
}
