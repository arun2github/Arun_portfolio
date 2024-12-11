import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dashboardController.dart';
import 'package:flutter_img/flutter_img.dart';

class Services extends StatelessWidget {
  Services({Key? key}) : super(key: key);

  DashboardController dashboardController = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return GridView.builder(
            primary: false,
            shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns in the grid
          crossAxisSpacing: 16.0, // Spacing between columns
          mainAxisSpacing: 16.0, // Spacing between rows
          childAspectRatio: 1.0, // Ratio between the width and height of items
        ),
        itemCount: dashboardController.technologyList.length,
        itemBuilder: (context, index) {
          var technology = dashboardController.technologyList[index];
          return Card(
            elevation: 2.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(8.0)),
                    child: Img(
                      technology.icon,
                      fit: BoxFit.cover,
                      border: Border.all(width: 2),
                    ),
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
      );
    });
    // return Obx(() {
    //   return ListView.builder(
    //     primary: false,
    //     shrinkWrap: true,
    //     itemCount: dashboardController.technologyList.length,
    //     itemBuilder: (context, index) {
    //       var service = dashboardController.technologyList[index];
    //       return ListTile(
    //         contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    //         leading: SizedBox(
    //           width: 100, // Adjust the width as needed
    //           height: 100, // Adjust the height as needed
    //           child: Img(
    //             service.icon,
    //             fit: BoxFit.cover, // Adjust fit as per your requirement
    //             border: Border.all(width: 2),
    //             borderRadius: const BorderRadius.all(Radius.circular(3)),
    //           ),
    //         ),
    //         title: Text(service.name),
    //       );
    //     },
    //   );
    // });
  }
}
