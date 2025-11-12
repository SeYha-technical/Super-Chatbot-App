import 'package:chat_bot/helper/pref.dart';
import 'package:chat_bot/screen/home/home.dart';
import 'package:chat_bot/screen/widget/animetion_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'helper/global.dart';
import 'onboarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    //wait for some time on splash & then move to next screen
    Future.delayed(const Duration(seconds: 3), () {
      Get.off(() =>
      Pref.showOnboarding ? const OnboardingScreen() : const HomeScreen());    });
  }
  @override
  Widget build(BuildContext context) {
    //initializing device size
    mq = MediaQuery.sizeOf(context);
    return Scaffold(
      //body
      body: SizedBox(
        width: double.maxFinite,
        child: Column(
          children: [
            //for adding some space
            const Spacer(flex: 2),
            //logo
            Card(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Padding(
                padding: EdgeInsets.all(mq.width * .05),
                child: Image.asset(
                  'assets/images/assistant.png',
                  width: mq.width * .4,
                ),
              ),
            ),
            //for adding some space
            const Spacer(),
            //lottie loading
             const CustomLoading(),
            //for adding some space
            const Spacer(),
          ],
        ),
      ),
    );
  }
}