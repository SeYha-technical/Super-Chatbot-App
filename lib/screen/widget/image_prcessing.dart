import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ImageProcessing extends StatelessWidget {
  const ImageProcessing({super.key});

  @override
  Widget build(BuildContext context) {
    return Lottie.asset('assets/lottie/AI loading.json', width: 100);
  }
}
