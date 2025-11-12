import 'package:chat_bot/models/home_feature.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lottie/lottie.dart';

import '../../helper/global.dart';
class HomeCard extends StatelessWidget {
  final HomeFeature homeFeature;
  const HomeCard({super.key, required this.homeFeature});
  @override
  Widget build(BuildContext context) {
    Animate.restartOnHotReload=true;
    return InkWell(
      onTap:homeFeature.onTap ,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        color: Colors.cyanAccent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Lottie.asset('assets/lottie/${homeFeature.lottie}.json',
            width: mq.width * .35),
            Text( homeFeature.title,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18),),
          ],
        ),
      ).animate().scale(duration: 1.5.seconds,),
    );
  }
}
