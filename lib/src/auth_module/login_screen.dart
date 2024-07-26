import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tezda_smit_task/src/auth_module/controller/login_controller.dart';
import 'package:tezda_smit_task/src/auth_module/register_screen.dart';
import 'package:tezda_smit_task/src/dashboard_module/dashboard_screen.dart';
import 'package:tezda_smit_task/utills/commonButton.dart';
import 'package:tezda_smit_task/utills/commonTextFeild.dart';
import 'package:tezda_smit_task/utills/extentions_custom.dart';

final obscureTextProvider = StateProvider<bool>((ref) => true);

class LoginScreen extends ConsumerWidget {
  LoginScreen({Key? key}) : super(key: key);

  final TextEditingController _email = TextEditingController();
  final TextEditingController _pass = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    final obscureText = ref.watch(obscureTextProvider);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            vertical: 40.h,
            horizontal: 20.w,
          ),
          child: Column(
            children: [
              60.height(),
              Text(
                "Welcome!",
                style: textTheme.displayLarge,
              ),
              4.height(),
              Text(
                "Glad To see U",
                style: textTheme.displaySmall,
              ),
              20.height(),
              CommonTextFeild(
                textTheme: textTheme,
                controller: _email,
                hintText: "Email",
              ),
              CommonTextFeild(
                textTheme: textTheme,
                controller: _pass,
                hintText: "Password",
                obscureText: obscureText,
                suffix: InkWell(
                  onTap: () {
                    ref.read(obscureTextProvider.notifier).state = !obscureText;
                  },
                  child: Icon(
                    obscureText ? Icons.visibility : Icons.visibility_off,
                    color: colorScheme.onPrimary,
                  ),
                ),
              ),
              20.height(),
              CommonButton(
                minWidth: double.maxFinite,
                textTheme: textTheme,
                onPressed: () async {
                  final authRepository = ref.read(authRepositoryProvider);
                  try {
                    await authRepository.signInWithEmailAndPassword(
                      _email.text.trim(),
                      _pass.text.trim(),
                    );
                    // Handle successful login (e.g., navigate to home screen)
                    context.pushReplacement(DashBoardScreen(
                      userName: authRepository.auth.currentUser?.email ?? "User",
                    ));

                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      backgroundColor: Colors.greenAccent,
                      content: Text("Login Successfully!"),
                    ));
                  } on FirebaseAuthException catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(e.message ?? 'An error occurred'),
                    ));
                  }
                },
                name: "LOGIN",
              ),
              20.height(),
              InkWell(
                onTap: () {
                  context.push(RegisterScreen());
                },
                child: Text(
                  "Don't Have An Account?",
                  style: textTheme.bodyLarge,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
