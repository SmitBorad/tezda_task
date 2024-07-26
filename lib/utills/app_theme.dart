import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tezda_smit_task/utills/AppColors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme() => ThemeData(
        scaffoldBackgroundColor: const Color(0xffFFFFFF),
        primaryColor: const Color(0xff1DD6FF),
        dividerColor: colorE3E3E3,
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          },
        ),
        cardColor: const Color(0xffFFFFFF),
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: colorPrimary,
          onPrimary: color616161,
          secondary: Color(0xffFFFFFF),
          onSecondary: color9D9D9D,
          error: Colors.red,
          onError: Colors.red,
          background: Colors.red,
          onBackground: Colors.red,
          surface: colorWhite,
          onSurface: Colors.red,
        ),
        indicatorColor: colorBlack,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        appBarTheme: AppBarTheme(
          backgroundColor: const Color(0xffffffff),
          iconTheme: const IconThemeData(
            color: Color(0xff2D2D2D),
          ),
          elevation: 0,
          centerTitle: false,
          titleTextStyle: TextStyle(
            color: const Color(0xff616161),
            fontSize: 18.sp,
            fontFamily: "Montserrat",
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            textStyle: TextStyle(
              color: const Color(0xff2D2D2D),
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        fontFamily: "Montserrat",
        checkboxTheme: CheckboxThemeData(
          fillColor: MaterialStateProperty.resolveWith(
            (Set states) {
              if (states.contains(MaterialState.disabled)) {
                return const Color(0xff000000);
              }
              return const Color(0xffffffff);
            },
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: Colors.black,
        ),
        textTheme: TextTheme(
          displayLarge: TextStyle(
            color: Colors.black,
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
          ),
          displayMedium: TextStyle(
            color: Colors.black,
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
          ),
          displaySmall: TextStyle(
            color: Colors.black,
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
          ),
          headlineMedium: TextStyle(
            color: Colors.black,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
          headlineSmall: TextStyle(
            color: Colors.black,
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
          ),
          titleLarge: TextStyle(
            color: Colors.black,
            fontSize: 10.sp,
            fontWeight: FontWeight.w500,
          ),
          bodyLarge: TextStyle(
            color: const Color(0xff616161),
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
          ),
          bodyMedium: TextStyle(
            color: const Color(0xff616161),
            fontSize: 10.sp,
            fontWeight: FontWeight.w400,
          ),
          titleMedium: TextStyle(
            color: color616161,
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
          ),
          titleSmall: TextStyle(
            color: color616161,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
          labelLarge: TextStyle(
            color: Colors.black,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
          bodySmall: TextStyle(
            color: Colors.black,
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
          ),
          labelSmall: TextStyle(
            color: Colors.black,
            fontSize: 10.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
      );

  static ThemeData darkTheme() => ThemeData(
        scaffoldBackgroundColor: const Color(0xff181829),
        primaryColor: const Color(0xff1DD6FF),
        dividerColor: Color(0xff2B2B3D),
        dividerTheme: DividerThemeData(color: Color(0xff2B2B3D)),
        cardColor: Color(0xff2B2B3D),
        colorScheme: const ColorScheme(
          brightness: Brightness.dark,
          primary: colorPrimary,
          onPrimary: colorWhite,
          secondary: Color(0xff2B2B3D),
          onSecondary: color1A2634,
          error: Colors.red,
          onError: Colors.red,
          background: Colors.red,
          onBackground: Colors.red,
          surface: Color(0xff222232),
          onSurface: Colors.red,
        ),
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          },
        ),
        indicatorColor: colorWhite,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        appBarTheme: AppBarTheme(
          backgroundColor: const Color(0xff181829),
          iconTheme: const IconThemeData(
            color: Color(0xffffffff),
          ),
          elevation: 0,
          centerTitle: false,
          titleTextStyle: TextStyle(
            color: const Color(0xffFFFFFF),
            fontSize: 18.sp,
            fontFamily: "Montserrat",
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            textStyle: TextStyle(
              color: const Color(0xff2D2D2D),
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        fontFamily: "Montserrat",
        checkboxTheme: CheckboxThemeData(
          fillColor: MaterialStateProperty.resolveWith(
            (Set states) {
              if (states.contains(MaterialState.disabled)) {
                return const Color(0xff000000);
              }
              return const Color(0xffffffff);
            },
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: Colors.white,
        ),
        textTheme: TextTheme(
          displayLarge: TextStyle(
            color: Colors.white,
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
          displayMedium: TextStyle(
            color: Colors.white,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
          displaySmall: TextStyle(
            color: Colors.white,
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
          ),
          headlineMedium: TextStyle(
            color: Colors.white,
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
          ),
          headlineSmall: TextStyle(
            color: Colors.white,
            fontSize: 10.sp,
            fontWeight: FontWeight.w500,
          ),
          titleLarge: TextStyle(
            color: Colors.white,
            fontSize: 10.sp,
            fontWeight: FontWeight.w500,
          ),
          bodyLarge: TextStyle(
            color: const Color(0xffAAAAAA),
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
          ),
          bodyMedium: TextStyle(
            color: const Color(0xffAAAAAA),
            fontSize: 10.sp,
            fontWeight: FontWeight.w400,
          ),
          titleMedium: TextStyle(
            color: colorAAAAAA,
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
          ),
          titleSmall: TextStyle(
            color: colorAAAAAA,
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
          ),
          labelLarge: TextStyle(
            color: colorAAAAAA,
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
          ),
          bodySmall: TextStyle(
            color: Colors.black,
            fontSize: 10.sp,
            fontWeight: FontWeight.w400,
          ),
          labelSmall: TextStyle(
            color: Colors.black,
            fontSize: 10.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
      );
}
