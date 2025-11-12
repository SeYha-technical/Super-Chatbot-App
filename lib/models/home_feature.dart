
import 'package:chat_bot/screen/feature/chat.dart';
import 'package:chat_bot/screen/feature/image.dart';
import 'package:chat_bot/screen/feature/translate.dart';
import 'package:flutter/animation.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

enum HomeFeature{AiChatBot,imageBot,AiTranslator}
extension MyHomeFeature on HomeFeature{
  String get title => switch (this){
    HomeFeature.AiChatBot => "AI ChatBot",
    HomeFeature.imageBot => "AI Image Generator",
    HomeFeature.AiTranslator => "AI Translate Language"
  };
  String get lottie => switch (this){
    HomeFeature.AiChatBot => 'ai_ask_me',
    HomeFeature.imageBot => 'ai_play',
    HomeFeature.AiTranslator => 'techno'
  };
  //for navigation
  VoidCallback get onTap => switch (this) {
    HomeFeature.AiChatBot => () => Get.to(() => const chatScreen()),
    HomeFeature.imageBot=> () => Get.to(() => const imageScreen()),
    HomeFeature.AiTranslator => () => Get.to(() => const tranSlateScreen()),
  };
}