import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_bot/controller/image_controller.dart';
import 'package:chat_bot/screen/widget/button.dart';
import 'package:chat_bot/screen/widget/image_prcessing.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../helper/global.dart';
class imageScreen extends StatefulWidget {
  const imageScreen({super.key});
  @override
  State<imageScreen> createState() => _chatScrennState();
}
class _chatScrennState extends State<imageScreen> {
  final _controller =ImageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Create Image as you Want'),
      ),
      floatingActionButton:Obx(()=>_controller.status.value==Status.completed? Padding(
        padding: const EdgeInsets.all(15.0),
        child: FloatingActionButton(
          shape:RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)) ,
          ),
          onPressed:(){},
          //_controller.saveNetworkImage,
          child: Icon(Icons.save_alt) ,
        ),
      ):Container()),
      body: ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.only(
        top: mq.height*0.02,bottom: mq.height*0.1,right:mq.width*0.04,left:mq.width*0.04,
        ),
children: [
  TextFormField(
    controller: _controller.textController,
    onTapOutside: (e)=>FocusScope.of(context).unfocus(),
    decoration: InputDecoration(fillColor: Colors.white,
        filled: true,
        hintText: 'Tell me what image you want create 🤗 ...',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
        )
    ),
  ),
  Container(
    height: mq.height*0.5,
    alignment: Alignment.center,
    child: Obx(()=>_generateImage()),
  ),
  CustomBtn(onTap: _controller.createImage, text:'Create'),
],
      ),
    );
  }
  Widget _generateImage()=>ClipRRect(
    borderRadius: BorderRadius.circular(12),
    child: switch(_controller.status.value) {
      Status.none =>  Lottie.asset('assets/lottie/Live chatbot.json'),
      Status.completed =>  CachedNetworkImage(
        imageUrl: _controller.url.value,
        placeholder: (context, url) => ImageProcessing(),
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
      Status.loading=> ImageProcessing(),
    },
  );
}
