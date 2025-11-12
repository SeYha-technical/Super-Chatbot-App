import 'package:chat_bot/helper/dailog.dart';
import 'package:chat_bot/models/message.dart';
import 'package:chat_bot/service/api_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ChatController  extends GetxController{
final textController = TextEditingController();
final scrollController = ScrollController();
final List= <Message>[(Message(msg: 'Hi,How can i help you today?', messageType: MessageType.bot))].obs;
void askQuestion()async{
  if(textController.text.trim().isNotEmpty){
    List.add(Message(msg: textController.text, messageType: MessageType.user));
    List.add(Message(msg: '', messageType: MessageType.bot));
    _scrollDown();
    final response = await apiService.getMessage(textController.text);
    List.removeLast();
    List.add(Message(msg: response, messageType: MessageType.bot));
    _scrollDown();
    textController.text='';
  }else{
    ShowDialog.require('please ask something');
  }
}
void _scrollDown(){
  scrollController.animateTo(scrollController.position.maxScrollExtent, duration:Duration(milliseconds: 500), curve:Curves.ease);
}
}