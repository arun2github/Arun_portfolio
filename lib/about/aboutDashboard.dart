import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:personal_portfolio/responsive.dart';

import '../shared/constants/commonStyle.dart';
import '../shared/constants/desktop_size_config.dart';
import '../shared/utils/commonWidget.dart';

class AboutDashboard extends StatelessWidget {
  const AboutDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return ResponsiveWidget(
      smallScreen:GlassContainer (


        blur: 2,
        color: Colors.white.withOpacity(0.1),
        //  color: Colors.red,
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Colors.purple,
            Colors.black,
          ],
        ),
        border: Border.fromBorderSide(BorderSide.none),
        shadowStrength: 5,
        borderRadius: BorderRadius.circular(12),
        shadowColor: Colors.white.withOpacity(0.24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            ShaderMask(
              shaderCallback: (Rect bounds) {
                return LinearGradient(colors: [
                  Color(0xFF967DE5),
                  Color(0xFF2FAEEE),
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter)
                    .createShader(bounds);
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0,top: 20),
                child: AutoSizeText(
                  "About Me: ",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                      color: CommonStyle.white,
                      fontFamily: CommonStyle.FONT_MONTSERRAT),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AutoSizeText(
                CommonStyle.about,
                style: CommonStyle.getMontserratStyle(
                    space_16, FontWeight.w500, Colors.white),
              ),
            ),
            CommonWidget.rowHeight10(),
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
                ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return LinearGradient(colors: [
                      Color(0xFF967DE5),
                      Color(0xFF2FAEEE),
                    ], begin: Alignment.topCenter, end: Alignment.bottomCenter)
                        .createShader(bounds);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AutoSizeText(
                      "About Me: ",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                          color: CommonStyle.white,
                          fontFamily: CommonStyle.FONT_MONTSERRAT),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AutoSizeText(
                    CommonStyle.about,
                    style: CommonStyle.getMontserratStyle(
                        space_18, FontWeight.w500, Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
