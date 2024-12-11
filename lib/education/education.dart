import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_img/flutter_img.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../dashboardController.dart';
import '../responsive.dart';
import '../shared/constants/commonStyle.dart';
import '../shared/constants/desktop_size_config.dart';

class Education extends StatelessWidget {
  Education({super.key});
  DashboardController dashboardController = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return ResponsiveWidget(
      smallScreen: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: AutoSizeText(
                " Acedemic History ",
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: 22.0,
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
                padding: const EdgeInsets.only(top: 10),
                child: AutoSizeText(
                  " Education: ",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                      color: CommonStyle.white,
                      fontFamily: CommonStyle.FONT_MONTSERRAT),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Container(
              child: ListView.builder(
                primary: false,
                shrinkWrap: true,
                itemCount: dashboardController.educationList.length,
                itemBuilder: (context, index) {
                  var education = dashboardController.educationList[index];
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TimelineTile(
                        hasIndicator: true,
                        beforeLineStyle: const LineStyle(
                          thickness: 2,
                          color:  Colors.white,
                        ),
                        axis: TimelineAxis.vertical,
                        alignment: TimelineAlign.start,
                        indicatorStyle:  IndicatorStyle(
                          width: 80,
                          indicator: Center(
                            child: Container(
                              padding: EdgeInsets.all(2), // Adjust the padding to control border width
                              decoration: BoxDecoration(
                                color: Colors.white, // Background color of the CircleAvatar
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.white, // Color of the border
                                  width: 2, // Width of the border
                                ),
                              ),
                              child: CircleAvatar(
                                radius: 60,

                                child: ClipOval(
                                  child: Img(
                                    education.icon, // Replace with your image URL or asset path
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
                          child: customEducationContainer(
                            education.title,
                            education.collegeName,
                            education.icon,
                            education.date,
                            education.branch,
                            education.percentage,
                          ),
                        )
                        //     : Padding(
                        //   padding: const EdgeInsets.all(8.0),
                        //   child: Padding(
                        //     padding: const EdgeInsets.all(8.0),
                        //     child: Container(
                        //
                        //       child: Text(
                        //         education.date,
                        //         style: TextStyle(fontSize: 20),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        // startChild: index % 2  == 0
                        //     ? Padding(
                        //   padding: const EdgeInsets.all(8.0),
                        //   child: Container(
                        //     alignment: Alignment.centerRight,
                        //
                        //     child: Text(
                        //       education.date,
                        //       style: TextStyle(fontSize: 20),
                        //     ),
                        //   ),
                        // )
                        //     : customEducationContainer(
                        //   education.title,
                        //   education.collegeName,
                        //   education.icon,
                        //   education.date,
                        //   education.branch,
                        //   education.percentage,
                        // ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      largeScreen: Center(
        child: Container(
          width:width*0.9 ,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: AutoSizeText(
                  " Acedemic History ",
                  textAlign: TextAlign.start,
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
                    "Education: ",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.w600,
                        color: CommonStyle.white,
                        fontFamily: CommonStyle.FONT_MONTSERRAT),
                  ),
                ),
              ),

              SizedBox(height: 40,),
              Container(
                child: ListView.builder(
                  primary: false,
                  shrinkWrap: true,
                  itemCount: dashboardController.educationList.length,
                  itemBuilder: (context, index) {
                    var education = dashboardController.educationList[index];
                    return Center(
                      child: TimelineTile(
                        hasIndicator: true,
                        beforeLineStyle: const LineStyle(
                          thickness: 4,
                          color:  Colors.white,
                        ),
                        axis: TimelineAxis.vertical,
                        alignment: TimelineAlign.center,
                        indicatorStyle:  IndicatorStyle(
                          width: 80,
                          indicator: Center(
                            child: Container(
                              padding: EdgeInsets.all(2), // Adjust the padding to control border width
                              decoration: BoxDecoration(
                                color: Colors.white, // Background color of the CircleAvatar
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.white, // Color of the border
                                  width: 2, // Width of the border
                                ),
                              ),
                              child: CircleAvatar(
                                radius: 60,
                                child: ClipOval(
                                  child: Img(
                                    education.icon, // Replace with your image URL or asset path
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
                            ? customEducationContainer(
                          education.title,
                          education.collegeName,
                          education.icon,
                          education.date,
                          education.branch,
                          education.percentage,
                        )
                            : Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(

                              child: Text(
                                education.date,
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                        startChild: index % 2  == 0
                            ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            alignment: Alignment.centerRight,

                            child: Text(
                              education.date,
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        )
                            : customEducationContainer(
                          education.title,
                          education.collegeName,
                          education.icon,
                          education.date,
                          education.branch,
                          education.percentage,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );

  }


  Widget customEducationContainer( String title, String collegeName, String icon, String date,String branch,String percentage){
    return Container(
      decoration: BoxDecoration(
          color: Colors.purple,
        border: Border(
bottom: BorderSide(
  width: 5,
  color: Colors.white
)
        )
      ),


      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: CommonStyle.getMontserratStyle(
                  space_30, FontWeight.w500, Colors.white),
            ),
            SizedBox(height: 10,),
          Text(
              collegeName,
              style: CommonStyle.getMontserratStyle(
                  space_20, FontWeight.w500, Colors.white),
            ),

            SizedBox(height: 10,),
            Text(
              branch,
              style: CommonStyle.getMontserratStyle(
                  space_20, FontWeight.w500, Colors.white),
            ),
            SizedBox(height: 10,),
         Text(
              "Branch : ${branch}",
              style: CommonStyle.getMontserratStyle(
                  space_20, FontWeight.w500, Colors.white),
            ),
            SizedBox(height: 10,),
            Text(
              "Percentage : ${percentage}",
              style: CommonStyle.getMontserratStyle(
                  space_20, FontWeight.w500, Colors.white),
            ),

          ],
        ),
      ),
    );
  }
}
