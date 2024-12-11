
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:personal_portfolio/shared/constants/commonStyle.dart';
import 'package:personal_portfolio/shared/constants/desktop_size_config.dart';
import 'package:personal_portfolio/shared/utils/commonWidget.dart';
import 'package:get/get.dart';

class NavBarMobileScreen extends StatelessWidget {
  NavBarMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(),
      body: GlassContainer(
        height: height,
        width: width,
        blur: 2,
        color: Colors.white.withOpacity(0.1),
        //  color: Colors.red,
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.purple,
              Colors.pink,
            ],
          ),
        border: Border.fromBorderSide(BorderSide.none),
        shadowStrength: 5,
        borderRadius: BorderRadius.circular(16),
        shadowColor: Colors.white.withOpacity(0.24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Close button positioned at the top left
            InkWell(
              onTap: () {
                Get.back();
              },
              child: Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Close',
                    style: CommonStyle.getMontserratStyle(
                      space_15,
                      FontWeight.w600,
                      Colors.blue,
                    ),
                  ),
                ),
              ),
            ),
            // Other texts centered vertically and horizontally
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Work',
                    style: CommonStyle.getMontserratStyle(
                      space_25,
                      FontWeight.w600,
                      Colors.blue,
                    ),
                  ),
                  CommonWidget.rowHeight20(),
                  Text(
                    'About',
                    style: CommonStyle.getMontserratStyle(
                      space_25,
                      FontWeight.w600,
                      Colors.blue,
                    ),
                  ),
                  CommonWidget.rowHeight20(),
                  Text(
                    'Contact',
                    style: CommonStyle.getMontserratStyle(
                      space_25,
                      FontWeight.w600,
                      Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
