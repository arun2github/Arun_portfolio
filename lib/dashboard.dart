import 'dart:html';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:personal_portfolio/responsive.dart';
import 'package:personal_portfolio/shared/constants/commonStyle.dart';
import 'package:personal_portfolio/shared/constants/desktop_size_config.dart';
import 'package:personal_portfolio/shared/utils/commonWidget.dart';
import 'package:personal_portfolio/social/socialMedia.dart';
import 'package:personal_portfolio/tech/Tech.dart';
import 'package:personal_portfolio/education/education.dart';
import 'InfoDashboard.dart';

import 'about/aboutDashboard.dart';
import 'contact/contact.dart';
import 'dashboardController.dart';
import 'project/project.dart';
import 'experience/workExperience.dart';
import 'model/Social.dart';
import 'navBar_mobile.dart';
import 'package:personal_portfolio/services.dart';

class Dashboard extends StatelessWidget {
  Dashboard({super.key});

  final dashboardController = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: CustomAppBar(context),
          toolbarHeight: 100,
        ),
        //  padding: EdgeInsets.only(top: 20),

        body: ListView(
          primary: true,
          shrinkWrap: true,
          children:  [
             InfoDashboard(),

            AboutDashboard(),
           // Align(alignment: Alignment.topLeft, child: Services()),
             Tech(),
            WorkExperience(),
            Project(),
            Education(),
            SizedBox(height: 50,),
            Contact(),


          ],
        ),

    );
  }

  Widget CustomAppBar(BuildContext context) {
    DashboardController dashboardController = Get.put(DashboardController());

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    bool onThemeChange(bool) {
      return dashboardController.switchMode.value =
          !dashboardController.switchMode.value;
    }

    return ResponsiveWidget(
      smallScreen: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                'assets/images/logo.png',
              height: 20,
                width: 20,
              ),
            ),
            //CommonWidget.rowHeight10(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Get.dialog(NavBarMobileScreen());
                },
                child: Icon(
                  Icons.menu,
                  color: Colors.deepPurple,
                ),
              ),
            ),
          ],
        ),
      ),
      largeScreen: Center(
        child: Padding(
          padding: const EdgeInsets.only(
              top: space_8, left: space_8, right: space_8, bottom: space_8),
          child: Container(
            // margin: EdgeInsets.only(top:space_20),
            width: width * 0.9,
            height: 70,
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.purple),
                borderRadius: BorderRadius.circular(40)),
            child: Row(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        CommonWidget.rowWidth10(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            'assets/images/logo.png',
                            height: 100,
                            width: 100,
                          ),

                        ),
                        CommonWidget.rowWidth20(),
                        Text(
                          'Home',
                          style: CommonStyle.getMontserratStyle(
                            space_15,
                            FontWeight.w500,
                            Colors.white,
                          ),
                        ),
                        CommonWidget.rowWidth20(),
                        Text(
                          'Projects',
                          style: CommonStyle.getMontserratStyle(
                            space_15,
                            FontWeight.w500,
                            Colors.white,
                          ),
                        ),
                        CommonWidget.rowWidth20(),
                        Text(
                          'Blog',
                          style: CommonStyle.getMontserratStyle(
                            space_15,
                            FontWeight.w500,
                            Colors.white,
                          ),
                        ),
                        CommonWidget.rowWidth20(),
                        Text(
                          'Contact',
                          style: CommonStyle.getMontserratStyle(
                            space_15,
                            FontWeight.w500,
                            Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  child: Obx(
                    () => Row(
                      children: [
                        Switch(
                            value: dashboardController.switchMode.value,
                            onChanged: onThemeChange),
                        Container(
                            width: 120,
                            height: 30,
                            decoration: BoxDecoration(
                              color: Colors.purple.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                                child: Padding(
                              padding: const EdgeInsets.only(bottom: 4.0),
                              child: Text(
                                'Contact me',
                                style: CommonStyle.getMontserratStyle(
                                    space_15, FontWeight.w600, Colors.white),
                              ),
                            )))
                      ],
                    ),
                  ),
                ),
                CommonWidget.rowWidth10(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
