import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';

import '../shared/constants/app_text.dart';
import '../shared/constants/commonStyle.dart';

List<TyperAnimatedText> mobileList = [
  TyperAnimatedText(CommonStyle.title1,
      speed: const Duration(milliseconds: 50),
      textStyle:CommonStyle.getMontserratStyle(20, FontWeight.w500,CommonStyle.magenta)),
  TyperAnimatedText(CommonStyle.title2,
      speed: const Duration(milliseconds: 50),
      textStyle:CommonStyle.getMontserratStyle(20, FontWeight.w500,CommonStyle.magenta)),
  // TyperAnimatedText(animationtxt3,
  //     speed: const Duration(milliseconds: 50),
  //     textStyle: AppText.h2!.copyWith(fontSize: 16))
];

List<TyperAnimatedText> destopList = [
  TyperAnimatedText(CommonStyle.title1,
      speed: const Duration(milliseconds: 50),
  textStyle:CommonStyle.getMontserratStyle(32, FontWeight.w500,CommonStyle.magenta)),
  TyperAnimatedText(CommonStyle.title2,
      speed: const Duration(milliseconds: 50),
  textStyle:CommonStyle.getMontserratStyle(32, FontWeight.w500,CommonStyle.magenta)),

];