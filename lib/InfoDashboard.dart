import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:personal_portfolio/responsive.dart';
import 'package:personal_portfolio/shared/constants/commonStyle.dart';
import 'package:personal_portfolio/shared/constants/desktop_size_config.dart';
import 'package:personal_portfolio/shared/utils/commonWidget.dart';
import 'package:personal_portfolio/social/socialMedia.dart';
import 'package:personal_portfolio/widgets/animation_image.dart';
import 'package:personal_portfolio/widgets/animation_text.dart';
import 'package:personal_portfolio/widgets/color_change_button.dart';
import 'dart:html' as html;

class InfoDashboard extends StatelessWidget {
  const InfoDashboard({super.key});

  void downloadPdf(String fileName) async {
    // Load the PDF file from assets
    final data = await rootBundle.load('assets/pdf/$fileName');
    final bytes = data.buffer.asUint8List();

    // Convert the PDF data to a Blob
    final blob = html.Blob([bytes], 'application/pdf');

    // Create a download link
    final url = html.Url.createObjectUrlFromBlob(blob);
    final anchor = html.AnchorElement(href: url)
      ..setAttribute('download', fileName)
      ..click();

    // Clean up
    html.Url.revokeObjectUrl(url);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return ResponsiveWidget(
      smallScreen: buildSmallScreen(context, width, height),
      largeScreen: buildLargeScreen(context, width),
    );
  }

  Widget buildSmallScreen(BuildContext context, double width, double height) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: width,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Image.asset(
                    'assets/images/profile_pic.png',
                    height: 300,
                   fit: BoxFit.cover,
                  ),
                ),
              ),
              CommonWidget.rowHeight20(),
              AutoSizeText(
                CommonStyle.hellotag ?? 'Hello', // Fallback if null
                style: CommonStyle.getMontserratStyle(
                    space_16, FontWeight.w600, Colors.white),
              ),
              CommonWidget.rowHeight10(),
              AutoSizeText(
                CommonStyle.name ?? 'Your Name', // Fallback if null
                style: CommonStyle.getMontserratStyle(
                    space_20, FontWeight.w600, Colors.white),
              ),
              CommonWidget.rowHeight10(),
              if (mobileList != null) // Ensure mobileList is not null
                AnimatedTextKit(
                  isRepeatingAnimation: true,
                  repeatForever: true,
                  animatedTexts: mobileList,
                ),
              CommonWidget.rowHeight15(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ColorChageButton(
                    text: 'download cv',
                    onTap: () => downloadPdf('test.pdf'),
                  ),
                  CommonWidget.rowWidth10(),
                  SocialMediaWidget()
                ],
              ),
              CommonWidget.rowHeight20(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildLargeScreen(BuildContext context, double width) {
    return Center(
      child: Container(
        width: width*.9,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: width * 0.7,
                // margin: EdgeInsets.only(left: space_150, top: space_80),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonWidget.rowHeight10(),
                    AutoSizeText(
                      CommonStyle.hellotag ?? 'Hello', // Fallback if null
                      style: CommonStyle.getMontserratStyle(
                          space_40, FontWeight.w600, Colors.white),
                    ),
                    CommonWidget.rowHeight10(),
                    AutoSizeText(
                      CommonStyle.welcometag ?? 'Hello', // Fallback if null
                      style: CommonStyle.getMontserratStyle(
                          space_32, FontWeight.w600, Colors.blueGrey),
                    ),
                    CommonWidget.rowHeight10(),
                    AutoSizeText(
                      CommonStyle.name ?? 'Your Name', // Fallback if null
                      style: CommonStyle.getMontserratStyle(
                          space_40, FontWeight.w600, Colors.white),
                    ),
                    CommonWidget.rowHeight15(),
                    if (destopList != null) // Ensure destopList is not null
                      AnimatedTextKit(
                        isRepeatingAnimation: true,
                        repeatForever: true,
                        animatedTexts: destopList,
                      ),
                    CommonWidget.rowHeight15(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ColorChageButton(
                          text: 'download cv',
                          onTap: () => downloadPdf('test.pdf'),
                        ),
                        CommonWidget.rowWidth50(),
                        SocialMediaWidget()
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ImageAnimation(),
            ),
          ],
        ),
      ),
    );
  }
}
