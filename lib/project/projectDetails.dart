import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_img/flutter_img.dart';
import 'package:get/get.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';

import '../dashboardController.dart';
import '../model/Project.dart';
import '../shared/constants/commonStyle.dart';

class ProjectStack extends StatelessWidget {
  DashboardController dashboardController = Get.put(DashboardController());
  final Project project;
  final int index;

  ProjectStack({Key? key, required this.index, required this.project})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return InkWell(
      onHover: (value) {
        dashboardController.onHover(index, value);
      },
      onTap: () {},
      borderRadius: BorderRadius.circular(16),
      child: AnimatedContainer(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: CommonStyle.bgColor),
          duration: const Duration(milliseconds: 500),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: height*0.3,
                  child: Img(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    project.image,
                    fit: BoxFit.contain,

                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    project.name,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child:Text(
                    project.description,
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Wrap(
                   direction: Axis.horizontal,
                    children: List.generate(project.tags.length, (index) {

                      final tag = project.tags[index];
                      final gradient = CommonStyle.gradientForName(tag['color']!);
                      return Padding(
                        padding: const EdgeInsets.only(right: 8.0,top: 4),
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                          decoration: BoxDecoration(
                            gradient: gradient,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Text(
                            "#${tag['name'].toString()}",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
