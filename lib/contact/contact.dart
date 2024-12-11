import 'package:flutter/material.dart';

import '../social/socialMedia.dart';

class Contact extends StatelessWidget {
  const Contact({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[900], // Background color
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Section Title
          Text(
            "Get in Touch",
            style: Theme.of(context).textTheme.headline6?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8.0),
          // Email
          Text(
            "Email: imarun1581@gmail.com",
            style: Theme.of(context).textTheme.bodyText1?.copyWith(
              color: Colors.white70,
            ),
          ),
          const SizedBox(height: 16.0),
          // Social Media Icons
          Center(child: SocialMediaWidget()),
          const SizedBox(height: 16.0),
          // Footer Text
          Text(
            "© 2024 Arun Kumar. All Rights Reserved.",
            style: Theme.of(context).textTheme.caption?.copyWith(
              color: Colors.white38,
            ),
          ),
        ],
      ),
    );
  }
}
