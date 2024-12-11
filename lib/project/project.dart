import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:personal_portfolio/responsive.dart';

import '../dashboardController.dart';
import '../shared/constants/commonStyle.dart';
import '../shared/constants/desktop_size_config.dart';
import 'projectDetails.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Project extends StatelessWidget {
  final int crossAxisCount;
  final double ratio;
  Project({super.key, this.crossAxisCount = 2, this.ratio = 1});

  DashboardController dashboardController = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return ResponsiveWidget(
      smallScreen: Center(
        child: Container(
          width: width * 0.9,
          child: ListView(
            primary: false,
            shrinkWrap: true,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: AutoSizeText(
                  "Here are some of my works: ",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.w600,
                    color: CommonStyle.white,
                    fontFamily: CommonStyle.FONT_MONTSERRAT,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Wrap(
                spacing: 10.0, // Space between horizontal items
                runSpacing: 20.0, // Space between vertical items
                children: dashboardController.projectList.map((project) {
                  final index = dashboardController.projectList.indexOf(project);
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: width , // Adjust the width of each item
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      gradient: const LinearGradient(colors: [
                        Colors.pinkAccent,
                        Colors.blue,
                      ]),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.pink,
                          offset: const Offset(-2, 0),
                          blurRadius:
                          dashboardController.hovers[index] ? 20 : 10,
                        ),
                        BoxShadow(
                          color: Colors.blue,
                          offset: const Offset(2, 0),
                          blurRadius:
                          dashboardController.hovers[index] ? 20 : 10,
                        ),
                      ],
                    ),
                    child: IntrinsicHeight(
                      child: ProjectStack(index: index, project: project),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),

      largeScreen: Center(
        child: Container(
          width: width * 0.9,
          child: ListView(
            primary: false,
            shrinkWrap: true,
            children: [
              SizedBox(
                height: 40,
              ),
              AutoSizeText(
                "Following projects showcases my skills and experience throug real-world examples of my work. Each project is briefly described with links to code repositories and live demos in it. It reflects my ability to solve complex problems, work with different technologies, and manage projects effectively. ",
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w400,
                    color: CommonStyle.white,
                    fontFamily: CommonStyle.FONT_MONTSERRAT),
              ),
              // ShaderMask(
              //   shaderCallback: (Rect bounds) {
              //     return LinearGradient(colors: [
              //       Color(0xFF967DE5),
              //       Color(0xFF2FAEEE),
              //
              //     ], begin: Alignment.topCenter, end: Alignment.bottomCenter)
              //         .createShader(bounds);
              //   },
              //   child: Padding(
              //     padding: const EdgeInsets.only(top: 20),
              //     child: AutoSizeText(
              //       "My Works:",
              //       textAlign: TextAlign.start,
              //       style: TextStyle(
              //           fontSize: 25.0,
              //           fontWeight: FontWeight.w600,
              //           color: CommonStyle.white,
              //           fontFamily: CommonStyle.FONT_MONTSERRAT),
              //     ),
              //   ),
              // ),

              SizedBox(
                height: 20,
              ),
              StaggeredGrid.count(
                crossAxisCount: 2, // Number of columns
                mainAxisSpacing: 10.0, // Vertical spacing
                crossAxisSpacing: 20.0, // Horizontal spacing
                children: List.generate(
                  dashboardController.projectList.length,
                      (index) {
                    var project = dashboardController.projectList[index];
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      margin: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        gradient: const LinearGradient(colors: [
                          Colors.pinkAccent,
                          Colors.blue,
                        ]),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.pink,
                            offset: const Offset(-2, 0),
                            blurRadius: dashboardController.hovers[index] ? 20 : 10,
                          ),
                          BoxShadow(
                            color: Colors.blue,
                            offset: const Offset(2, 0),
                            blurRadius: dashboardController.hovers[index] ? 20 : 10,
                          ),
                        ],
                      ),
                      child: ProjectStack(index: index, project: project),
                    );
                  },
                ),

              )
            ],
          ),
        ),
      ),
    );
  }
}
