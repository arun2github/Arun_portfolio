import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_img/flutter_img.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../dashboardController.dart';
import '../model/Technology.dart';
import '../responsive.dart';
import '../shared/constants/commonStyle.dart';
import '../shared/constants/desktop_size_config.dart';


class Tech extends StatelessWidget {

   Tech({super.key});

  DashboardController dashboardController = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return  ResponsiveWidget(
      smallScreen:Container(
child: Column(
  mainAxisAlignment: MainAxisAlignment.start,
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [

    Padding(
      padding: const EdgeInsets.only(top: 20),
      child: AutoSizeText(
        " What I have learned so far: ",
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w600,
            color: CommonStyle.white,
            fontFamily: CommonStyle.FONT_MONTSERRAT),
      ),
    ),

    ShaderMask(
      shaderCallback: (Rect bounds) {
        return LinearGradient(colors: [
          Color(0xFF967DE5),
          Color(0xFF2FAEEE),

        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)
            .createShader(bounds);
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 20,bottom: 20),
        child: AutoSizeText(
          " Technology Stack ",
          textAlign: TextAlign.start,
          style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w600,
              color: CommonStyle.white,
              fontFamily: CommonStyle.FONT_MONTSERRAT),
        ),
      ),
    ),

    GridView.builder(
      primary: false,
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        childAspectRatio: 1.0,
      ),
      itemCount: dashboardController.technologyList.length,
      itemBuilder: (context, index) {
        var technology = dashboardController.technologyList[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ClipOval(
                child: Img(
                  technology.icon,
                  height: 10,
                  width: 10,
                  border: Border.all(width: 2),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                technology.name,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        );
      },
    )
  ],
),
      ),
      largeScreen: Center(
        child: Container(
          width: width*0.9,

          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: AutoSizeText(
                        " What I have learned so far: ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 40.0,
                            fontWeight: FontWeight.w600,
                            color: CommonStyle.white,
                            fontFamily: CommonStyle.FONT_MONTSERRAT),
                      ),
                    ),

                  ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return LinearGradient(colors: [
                        Color(0xFF967DE5),
                        Color(0xFF2FAEEE),

                      ], begin: Alignment.topCenter, end: Alignment.bottomCenter)
                          .createShader(bounds);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: AutoSizeText(
                        " Technology Stack ",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600,
                            color: CommonStyle.white,
                            fontFamily: CommonStyle.FONT_MONTSERRAT),
                      ),
                    ),
                  ),
        SizedBox(height: 40,),

        GridView.builder(
            primary: false,
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 8,
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 16.0,
              childAspectRatio: 1.0,
            ),
            itemCount: dashboardController.technologyList.length,
            itemBuilder: (context, index) {
              var technology = dashboardController.technologyList[index];
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ClipOval(
                      child: Img(
                        technology.icon,
                        fit: BoxFit.contain,
                        height: 50,
                        width: 50,
                        border: Border.all(width: 2),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        technology.name,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              );
            },
        )
                ],
              ),
          ),
        ),
      ),
    );

  }
}
