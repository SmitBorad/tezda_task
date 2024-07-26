import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tezda_smit_task/service/auth_service.dart';
import 'package:tezda_smit_task/src/auth_module/login_screen.dart';
import 'package:tezda_smit_task/src/dashboard_module/dashboard_screen.dart';
import 'package:tezda_smit_task/utills/extentions_custom.dart';

import '../auth_module/controller/login_controller.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),
      () {
        final authRepository = ref.read(authRepositoryProvider);
        if (authRepository.auth.currentUser != null) {
          context.pushReplacement(
            DashBoardScreen(userName: authRepository.auth.currentUser?.email ?? "--"),
          );
        } else {
          context.pushReplacement(LoginScreen());
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlutterLogo(
          size: 160.h,
        ),
      ),
    );
  }
}
