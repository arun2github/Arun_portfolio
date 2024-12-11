import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_img/flutter_img.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:personal_portfolio/responsive.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../dashboardController.dart';
import '../shared/constants/commonStyle.dart';
import '../shared/constants/desktop_size_config.dart';

class WorkExperience extends StatelessWidget {
  WorkExperience({super.key});

  DashboardController dashboardController = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return ResponsiveWidget(
      smallScreen: Container(
          width: width * 0.9,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20,left: 10),
                child: AutoSizeText(
                  "What I have did so far: ",
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
                  padding: const EdgeInsets.only(top: 20,left: 10),
                  child: AutoSizeText(
                    " Work Experince: ",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.w600,
                        color: CommonStyle.white,
                        fontFamily: CommonStyle.FONT_MONTSERRAT),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ListView.builder(
                primary: false,
                shrinkWrap: true,
                itemCount: dashboardController.experienceList.length,
                itemBuilder: (context, index) {
                  var experience = dashboardController.experienceList[index];
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TimelineTile(
                          hasIndicator: true,
                          beforeLineStyle: const LineStyle(
                            thickness: 2,
                            color: Colors.white,
                          ),
                          axis: TimelineAxis.vertical,
                          alignment: TimelineAlign.start,
                          indicatorStyle: IndicatorStyle(
                            width: 60,
                            indicator: Center(
                              child: Container(
                                padding: EdgeInsets.all(
                                    2), // Adjust the padding to control border width
                                decoration: BoxDecoration(
                                  color: Colors
                                      .white, // Background color of the CircleAvatar
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.white, // Color of the border
                                    width: 2, // Width of the border
                                  ),
                                ),
                                child: CircleAvatar(
                                  radius: 80,
                                  child: ClipOval(
                                    child: Img(
                                      experience
                                          .icon, // Replace with your image URL or asset path
                                      fit: BoxFit.contain,
                                      height: 30,
                                      width: 30,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            height: 50,
                            drawGap: false,
                            color: Colors.purple,
                            padding: EdgeInsets.all(8),
                          ),
                          endChild:Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: customExpContainer(
                                experience.title,
                                experience.companyName,
                                experience.points,
                                context),
                          )


                      ),
                    ),
                  );
                },
              ),
            ],
          )),
      // largeScreen: Center(
      //   child: SizedBox(
      //     width: width * 0.8,
      //
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.start,
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: [
      //         ShaderMask(
      //           shaderCallback: (Rect bounds) {
      //             return LinearGradient(colors: [
      //               Color(0xFF967DE5),
      //               Color(0xFF2FAEEE),
      //             ], begin: Alignment.topCenter, end: Alignment.bottomCenter)
      //                 .createShader(bounds);
      //           },
      //           child: Padding(
      //             padding: const EdgeInsets.only(left: 15.0,top: 20,bottom: 20),
      //             child: AutoSizeText(
      //               "Work Experience: ",
      //               textAlign: TextAlign.start,
      //               style: TextStyle(
      //                   fontSize: 20.0,
      //                   fontWeight: FontWeight.w600,
      //                   color: CommonStyle.white,
      //                   fontFamily: CommonStyle.FONT_MONTSERRAT),
      //             ),
      //           ),
      //         ),
      //         Container(
      //           child: GridView.count(
      //               addRepaintBoundaries:true,
      //             physics: NeverScrollableScrollPhysics(), // Disable scrolling for the GridView
      //             shrinkWrap: true,
      //             crossAxisCount: 2,
      //             mainAxisSpacing: 10,
      //             crossAxisSpacing: 10,
      //             childAspectRatio: 1,
      //             children: List.generate(5, (index) {
      //               return Padding(
      //                 padding: const EdgeInsets.all(8.0),
      //                 child: Container(
      //                   margin: EdgeInsets.only(left: 15.0,right: 15),
      //                   // height: 50,
      //                   // width: 200,
      //                   clipBehavior: Clip.antiAlias,
      //                   decoration: ShapeDecoration(
      //                     gradient: RadialGradient(
      //                       center: Alignment(0.8, 0.8),
      //                       radius: 0.4,
      //                       colors: [
      //                         Colors.pink.withOpacity(0.03),
      //                         Colors.purple.withOpacity(0.3),
      //                       ],
      //                     ),
      //                     shape: RoundedRectangleBorder(
      //                       side: BorderSide(
      //                         width: 2,
      //                         color: Colors.purple,
      //                       ),
      //                       borderRadius: BorderRadius.circular(15),
      //                     ),
      //                   ),
      //                   child: BackdropFilter(
      //                     filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
      //                     child: Container(
      //
      //                     ),
      //                   ),
      //                 ),
      //               );
      //             }),
      //           ),
      //         ),
      //       ],
      //
      //     ),
      //   ),
      // ),
      largeScreen: Center(
        child: Container(
            width: width * 0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  "What I have did so far: ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.w600,
                      color: CommonStyle.white,
                      fontFamily: CommonStyle.FONT_MONTSERRAT),
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
                      " Work Experince: ",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.w600,
                          color: CommonStyle.white,
                          fontFamily: CommonStyle.FONT_MONTSERRAT),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                ListView.builder(
                  primary: false,
                  shrinkWrap: true,
                  itemCount: dashboardController.experienceList.length,
                  itemBuilder: (context, index) {
                    var experience = dashboardController.experienceList[index];
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TimelineTile(
                            hasIndicator: true,
                            beforeLineStyle: const LineStyle(
                              thickness: 4,
                              color: Colors.white,
                            ),
                            axis: TimelineAxis.vertical,
                            alignment: TimelineAlign.center,
                            indicatorStyle: IndicatorStyle(
                              width: 80,
                              indicator: Center(
                                child: Container(
                                  padding: EdgeInsets.all(
                                      2), // Adjust the padding to control border width
                                  decoration: BoxDecoration(
                                    color: Colors
                                        .white, // Background color of the CircleAvatar
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.white, // Color of the border
                                      width: 2, // Width of the border
                                    ),
                                  ),
                                  child: CircleAvatar(
                                    radius: 80,
                                    child: ClipOval(
                                      child: Img(
                                        experience
                                            .icon, // Replace with your image URL or asset path
                                        fit: BoxFit.contain,
                                        height: 50,
                                        width: 50,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              height: 50,
                              drawGap: false,
                              color: Colors.purple,
                              padding: EdgeInsets.all(8),
                            ),
                            endChild: index % 2 == 0
                                ? customExpContainer(
                                    experience.title,
                                    experience.companyName,
                                    experience.points,
                                    context)
                                : Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        child: Text(
                                          experience.date,
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ),
                                    ),
                                  ),
                            startChild: index % 2 == 0
                                ? Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        experience.date,
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ),
                                  )
                                : customExpContainer(
                                    experience.title,
                                    experience.companyName,
                                    experience.points,
                                    context)),
                      ),
                    );
                  },
                ),
              ],
            )),
      ),
    );
  }

  Widget customExpContainer(String title, String companyName, List<String> points, BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
        color: Colors.purple,
        border: Border(bottom: BorderSide(width: 5, color: Colors.white)),

        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: CommonStyle.getMontserratStyle(space_30, FontWeight.w500, Colors.white),
            ),
            SizedBox(height: 10),
            Text(
              companyName,
              style: CommonStyle.getMontserratStyle(space_20, FontWeight.w500, Colors.white),
            ),
            SizedBox(height: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: points.map((point) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.circle_sharp,
                          color: Colors.white,
                          size: 15,
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            point,
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
