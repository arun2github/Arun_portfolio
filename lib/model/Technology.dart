import 'package:flutter_img/flutter_img.dart'; // Import the package for Img

class Technology {
  String icon;
  String name;

  Technology({
    required this.icon,
    required this.name,
  });

  // Factory method to create a Technology object from JSON
  factory Technology.fromJson(Map<String, dynamic> json) {
    return Technology(
      icon: json['icon'] ?? '', // Provide default value if null
      name: json['name'] ?? '', // Provide default value if null
    );
  }
}
