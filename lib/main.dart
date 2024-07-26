import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tezda_smit_task/service/shared_Preference/preferences_helper.dart';

import 'src/splash_module/splash_screen.dart';
import 'utills/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyAQNQYhfcit6FFAmkcylXAVcfuLR0UWDn4",
      appId: "1:970345907981:android:c8500193f91d27edbc1244",
      messagingSenderId: "",
      projectId: "tezda-task-2e3bf",
    ),
  );
  await PreferenceUtils.init();
  runApp(
    // Adding ProviderScope enables Riverpod for the entire project
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      fontSizeResolver: FontSizeResolvers.radius,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          theme: AppTheme.lightTheme(),
          darkTheme: AppTheme.darkTheme(),
          // themeMode: themeMode,
          themeAnimationCurve: Curves.bounceIn,
          themeAnimationDuration: const Duration(microseconds: 0),
          debugShowCheckedModeBanner: false,
          builder: (context, child) {
            return child!;
          },
          home: child,
        );
      },
      child: const SplashScreen(),
    );
  }
}
