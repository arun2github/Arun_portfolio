import 'package:flutter/material.dart';

class CommonStyle{



  static Color magenta = hexToColor('#6A4421');
  static Color white = Color(0xFFFFFFFF);
  static Color bgColor = Color(0xFF000515);

  static final redTextGradient = LinearGradient(
    colors: [Color(0xFFFA7D82), Color(0xFFF06363)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static final blueTextGradient = LinearGradient(
    colors: [Color(0xFF7AA6FF), Color(0xFF3F65DD)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static final greenTextGradient = LinearGradient(
    colors: [Color(0xFF66FFD6), Color(0xFF00A3FF)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static final pinkTextGradient = LinearGradient(
    colors: [Color(0xFFFF94B1), Color(0xFFF06292)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static final yellowTextGradient = LinearGradient(
    colors: [Color(0xFFFFD86F), Color(0xFFFF8E73)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static LinearGradient gradientForName(String colorName) {
    switch (colorName) {
      case 'redTextGradient':
        return redTextGradient;
      case 'blueTextGradient':
        return blueTextGradient;
      case 'greenTextGradient':
        return greenTextGradient;
      case 'pinkTextGradient':
        return pinkTextGradient;
      case 'yellowTextGradient':
        return yellowTextGradient;
      default:
      // Return a default gradient or handle error
        return redTextGradient; // Default to red if color not found
    }
  }
  static const String name = "I'm Arun Kumar,";
  static const String hellotag = 'Hi there,';
  static const String welcometag = 'Welcome to My Tech Haven';
  static const String title1 = 'Mobile Application Developer';
  static const String title2 = 'Web Developer';
  static const String about = 'A Skilled flutter developer with a background in web development , Arun has transitioned from react development in the past years. Now the expertise lies in building beautiful and performant mobile and web applications using Flutter. Passionate about creating high-quality code that delivers and exceptional user experience , Arun actively contributes to open-source projects and always seeks opportunities to lean and grow as a developer. Outside of programming , Arun enjoy exploring music, literature and cooking.';

  static const String FONT_MONTSERRAT = "Montserrat";

  static const String PROFILE_ICON = 'assets/images/profile.jpg';

  // Assets from the root assets folder
  static const String logo = 'assets/images/logo.svg';
  static const String backend = 'assets/images/backend.png';
  static const String creator = 'assets/images/creator.png';
  static const String mobile = 'assets/images/mobile.png';
  static const String web = 'assets/images/web.png';
  static const String github = 'assets/images/github.png';
  static const String menu = 'assets/images/menu.svg';
  static const String close = 'assets/images/close.svg';

  // Assets from the tech folder
  static const String css = 'assets/images/tech/css.svg';
  static const String docker = 'assets/images/tech/docker.png';
  static const String figma = 'assets/images/tech/figma.png';
  static const String git = 'assets/images/tech/git.png';
  static const String html = 'assets/images/tech/html.svg';
  static const String javascript = 'assets/images/tech/js.svg';
  static const String mongodb = 'assets/images/tech/mongodb.png';
  static const String nodejs = 'assets/images/tech/nodejs.svg';
  static const String reactjs = 'assets/images/tech/react.svg';
  static const String redux = 'assets/images/tech/redux.svg';
  static const String tailwind = 'assets/images/tech/tailwind.svg';
  static const String typescript = 'assets/images/tech/typescript.png';
  static const String threejs = 'assets/images/tech/threejs.svg';
  static const String ruby = 'assets/images/tech/ruby.svg';
  static const String ror = 'assets/images/tech/ror.png';
  static const String mi = 'assets/images/tech/MI.png';
  static const String jwt = 'assets/images/tech/jwt.png';
  static const String jira = 'assets/images/tech/jira_logo.jpg.png';
  static const String df = 'assets/images/tech/dialogflow.png';
  static const String sql = 'assets/images/tech/sql.png';


  // Assets from the company folder
  static const String meta = 'assets/images/company/meta.png';
  static const String shopify = 'assets/images/company/shopify.png';
  static const String starbucks = 'assets/images/company/starbucks.png';
  static const String tesla = 'assets/images/company/tesla.png';

  // Other assets
  static const String carrent = 'assets/images/carrent.png';
  static const String jobit = 'assets/images/jobit.png';
  static const String tripguide = 'assets/images/tripguide.png';
  static const String schrocken = 'assets/images/company/schrocken.png';
  static const String ct = 'assets/images/company/ct.jpg';
  static const String chetu = 'assets/images/company/Chetu_Inc_Logo.png';
  static const String react = 'assets/images/react.png';
  static const String cgt = 'assets/images/cgt.png';
  static const String qem = 'assets/images/qem.png';
  static const String jnv = 'assets/images/education/jnv.png';
  static const String gniot = 'assets/images/education/gniot.jpg';
  static const String ins = 'assets/images/ins.jpg';
  static const String jnvs = 'assets/images/education/JNV_Logo.jpg';
  static const String fb = 'assets/images/facebook.png';
  static const String instagram = 'assets/images/instagram.png';
  static const String ln = 'assets/images/ln.png';
  static const String webLogo = 'assets/images/webLogo.svg';
  static const String nodeMailer = 'assets/images/nodeM.png';
  static const String netflix = 'assets/images/net.jpg';
  static const String fincare = 'assets/images/fincare.png';
  static const String flutter = 'assets/images/flutter.jpg';
  static const String crossSell = 'assets/images/CrossSell.jpg';





  static TextStyle getMontserratStyle(double fontSize, FontWeight fontWeight, Color color, {double? letterSpacing}){
    return (letterSpacing==null)?TextStyle(
      decoration: TextDecoration.none,
      fontSize: fontSize,
      fontFamily: FONT_MONTSERRAT,
      fontWeight:fontWeight,
      color: color,
    ):TextStyle(
      decoration: TextDecoration.none,
      fontSize: fontSize,
      fontFamily: FONT_MONTSERRAT,
      fontWeight:fontWeight,
      color: color,
    );
  }
  static const pinkpurple = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [Color(0XFFaa367c), Color(0XFF4a2fbd)],
  );

  static const grayBack = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0XFF2E2D36), Color(0XFF11101D)],
  );
  static const grayWhite = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFFFFFFF), Color(0xFFF3F2FF)],
  );

  static TextStyle getMontserratWithoutColorStyle(double fontSize, FontWeight fontWeight){
    return TextStyle(
      decoration: TextDecoration.none,
      fontSize: fontSize,
      fontFamily: FONT_MONTSERRAT,
      fontWeight:fontWeight,
    );
  }
  static TextStyle getMontserratDecorationStyle(double fontSize, FontWeight fontWeight, Color color,TextDecoration decoration){
    return TextStyle(
      decoration: decoration,
      fontSize: fontSize,
      fontFamily: FONT_MONTSERRAT,
      fontWeight:fontWeight,
      color: color,
    );
  }


}

Color hexToColor(String hex) {
  assert(RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hex),
  'hex color must be #rrggbb or #rrggbbaa');

  return Color(
    int.parse(hex.substring(1), radix: 16) +
        (hex.length == 7 ? 0xff000000 : 0x00000000),
  );
}