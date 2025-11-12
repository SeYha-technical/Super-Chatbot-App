import 'package:chat_bot/screen/widget/image_prcessing.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowDialog{
 static void require (String message){
   Get.snackbar('message',message,backgroundColor:Colors.orangeAccent,);
 } static void successfully (String message){
   Get.snackbar('message',message,backgroundColor:Colors.greenAccent,);
 } static void error (String message){
   Get.snackbar('message',message,backgroundColor:Colors.red,);
 }
 static void showLoadingDialog() {
   Get.dialog(const Center(child: ImageProcessing()));
 }
}