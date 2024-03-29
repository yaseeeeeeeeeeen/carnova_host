import 'package:flutter/material.dart';
import 'package:second_project/resources/constants/colors.dart';

class CustomFontStyles {
  static TextStyle normalOutfit =
      TextStyle(fontFamily: "Outfit", color: mainColorH);

  static TextStyle hintstyleOne =
      TextStyle(fontFamily: "Outfit", color: black.withOpacity(1));

  static TextStyle style1 =  TextStyle(
    fontFamily: "Outfit",
    fontSize: 23,
    fontWeight: FontWeight.w600,
    color: black,
  );

  static TextStyle logoutbutton = const TextStyle(
    fontFamily: "Outfit",
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Colors.red,
  );
  static TextStyle listtilesText = const TextStyle(
    fontFamily: "Outfit",
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  /////profile card texts
  static TextStyle profileName = const TextStyle(
    fontFamily: "Outfit",
    color: Colors.black,
    fontSize: 20,
    fontWeight: FontWeight.w500,
  );
  static TextStyle mailstyle = TextStyle(
    fontFamily: "Outfit",
    color: Colors.black.withOpacity(0.7),
    fontSize: 17,
    fontWeight: FontWeight.w600,
  );

  /////////////VEhicle screen/////////////
  static TextStyle tabcardtext1 = const TextStyle(
    fontFamily: "Outfit",
    color: Colors.black,
    fontSize: 17,
    fontWeight: FontWeight.w500,
  );
  static TextStyle ratingtitle = const TextStyle(
    fontFamily: "Outfit",
    color: Colors.white,
    fontSize: 15,
    fontWeight: FontWeight.w400,
  );

  static TextStyle style7 = const TextStyle(
    fontFamily: "Outfit",
    color: Colors.white,
    fontSize: 20,
    fontWeight: FontWeight.w800,
  );
  static TextStyle style5 = const TextStyle(
    fontFamily: "Outfit",
    color: Colors.black,
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );
  static TextStyle changePasswordFont = const TextStyle(
    fontFamily: "Outfit",
    color: Colors.black,
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );
  /////////////////////////Home Screen///////////////////////////////////////////////
  static TextStyle tileStatusText = TextStyle(
    fontFamily: "Outfit",
    fontSize: 13,
    fontWeight: FontWeight.w500,
    color: statusColor,
  );

  static TextStyle tileStatusTextRed = TextStyle(
    fontFamily: "Outfit",
    fontSize: 13,
    fontWeight: FontWeight.w500,
    color: Colors.red.shade800,
  );
  static TextStyle tileDateText = const TextStyle(
    fontFamily: "Outfit",
    fontSize: 13,
    fontWeight: FontWeight.w500,
  );
  static TextStyle policyText = const TextStyle(
    fontFamily: "Outfit",
    fontSize: 17,
    color: Colors.black,
  );
  static TextStyle labelStyle = const TextStyle(
    fontWeight: FontWeight.w600,
    fontFamily: "Outfit",
  );
}
