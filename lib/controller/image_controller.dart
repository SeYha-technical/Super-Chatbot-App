
import 'package:chat_bot/helper/dailog.dart';
import 'package:chat_bot/helper/global.dart';
import 'package:dart_openai/dart_openai.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
enum Status {none ,loading,completed}
class ImageController extends GetxController{
  final textController = TextEditingController();
  final status = Status.none.obs;
  final url =''.obs;
  Future <void> createImage()async{
    OpenAI.apiKey=apiKey;
    if(textController.text.trim().isNotEmpty){
      status.value=Status.loading;
      OpenAIImageModel image = await OpenAI.instance.image.create(
        model: "dall-e-3",
        prompt: textController.text,
        responseFormat: OpenAIImageResponseFormat.url,
        size: OpenAIImageSize.size1024,
      );
      url.value= image.data[0].url.toString();
      status.value=Status.completed;
    }else{
      ShowDialog.require('Text provide to generate image is required');
    }
  }
  // void saveNetworkImage() async {
  //   try{
  //     ShowDialog.showLoadingDialog();
  //     await GallerySaver.saveImage(url.value).then((success) {
  //       Get.back();
  //       ShowDialog.successfully('Image saved successfully');
  //     });
  //   }catch(e){
  //     Get.back();
  //     ShowDialog.error('Something Went Wrong (Try again in sometime)!');
  //     log('downlaodE:$e');
  //   }
  // }


  }

