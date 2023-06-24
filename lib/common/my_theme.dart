// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:ayyah_ride_customer/common/my_colors.dart';

get kAppThemeData => ThemeData(
      pageTransitionsTheme: PageTransitionsTheme(
        builders: {
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
        },
      ),
      brightness: Brightness.light,
      primaryColor: kPrimaryColor,
      backgroundColor: Colors.white,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: AppBarTheme(
        color: kPrimaryColor,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      accentColor: kAccentColor,
      iconTheme: IconThemeData(color: kBlack),
      fontFamily: "GT-Eesti",
      textTheme: TextTheme(
        headline1: TextStyle(
          color: kBlack,
        ),
        // title: TextStyle(
        //   fontStyle: FontStyle.normal,
        //   color: kBlack,
        // ),
        // body1: TextStyle(
        //   color: kBlack,
        // ),
        subtitle1: TextStyle(
          color: kBlack,
        ),
      ),
    );
