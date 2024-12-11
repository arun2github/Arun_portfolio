import 'package:flutter/material.dart';
import 'package:flutter_img/flutter_img.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:url_launcher/url_launcher.dart';

import '../dashboardController.dart';

class SocialMediaWidget extends StatelessWidget {
  SocialMediaWidget({super.key});

  DashboardController dashboardController = Get.put(DashboardController());
  void _launchURL(String url) async {
    print('url ${url.toString()}');
    final encodedUrl = Uri.encodeFull(url);
    print('url ${encodedUrl}');
    if (await canLaunch(encodedUrl)) {
      await launch(encodedUrl);
    } else {
      throw 'Could not launch $encodedUrl';
    }
  }

  Future<void> _launchInWebView(Uri url) async {
    if (!await launchUrl(url, mode: LaunchMode.inAppWebView)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
      children: dashboardController.socialList.map((social) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              print('social ${social.sourceLink}');
              _launchInWebView(Uri.parse(social.sourceLink));
              // _launchURL(social.sourceLink);
            },
            child: Img(social.img.toString(),
                fit: BoxFit.fill, width: 20, height: 20),
          ),
        );
      }).toList(),
    );
  }
}
