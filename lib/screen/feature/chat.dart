import 'package:chat_bot/controller/chat_controller.dart';
import 'package:chat_bot/screen/widget/message_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
class chatScreen extends StatefulWidget {

  const chatScreen({super.key});
  @override
  State<chatScreen> createState() => _chatScrennState();
}

class _chatScrennState extends State<chatScreen> {
  final _controller = ChatController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Here for assist'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(padding: EdgeInsets.symmetric(horizontal: 40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: TextFormField(
                controller: _controller.textController,
                onTapOutside: (e)=>FocusScope.of(context).unfocus(),
                decoration: InputDecoration(fillColor: Colors.white,
                  filled: true,
                  hintText: 'ask me something...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  )
                ),
              ),
            ),
            SizedBox(width: 10,),
            CircleAvatar(
              child:IconButton(
                onPressed: _controller.askQuestion,
                  icon:Icon(Icons.rocket) ,
            )
            )
          ],
        ),
      ),
      body: Obx(
            ()=> ListView(
              controller: _controller.scrollController,
        children:
          _controller.List.map((e)=>MessageCard(message:e)).toList(),
        ),
      ),

    );
  }
}
