import 'package:chat_bot/helper/pref.dart';
import 'package:chat_bot/models/home_feature.dart';
import 'package:chat_bot/screen/widget/home_card.dart';
import 'package:chat_bot/service/api_service.dart';
import 'package:flutter/material.dart';

import '../../helper/global.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  void initState() {
    super.initState();
    Pref.showOnboarding =false;
  }
  @override
  Widget build(BuildContext context) {
    apiService.getMessage('hii');
    mq = MediaQuery.sizeOf(context);
    return Scaffold(appBar: AppBar(
      title:Row(
        children: [
          Image.asset('assets/images/robot.png',
          width: mq.width * .13 ,
          ),
          Text(appName),
        ],
      ),
      centerTitle: true,
      actions: [
        IconButton(onPressed: (){}, icon: Icon(Icons.brightness_4)),],
    ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
        child: ListView(
        children: HomeFeature.values.map((e)=>HomeCard(homeFeature:e)).toList(),
            ),
      ),
    );
  }
}
