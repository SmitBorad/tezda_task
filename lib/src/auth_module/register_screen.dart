import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tezda_smit_task/src/auth_module/login_screen.dart';
import 'package:tezda_smit_task/utills/commonButton.dart';
import 'package:tezda_smit_task/utills/commonTextFeild.dart';
import 'package:tezda_smit_task/utills/extentions_custom.dart';

import 'controller/login_controller.dart';

final obscureTextProvider = StateProvider<bool>((ref) => true);
final obscureConfirmProvider = StateProvider<bool>((ref) => true);

class RegisterScreen extends ConsumerWidget {
  RegisterScreen({Key? key}) : super(key: key);

  final TextEditingController _email = TextEditingController();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _conformPass = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    final obscureText = ref.watch(obscureTextProvider);
    final obscureConform = ref.watch(obscureConfirmProvider);

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
                "Please Register Your Account",
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
              CommonTextFeild(
                textTheme: textTheme,
                controller: _conformPass,
                hintText: "Confirm Password",
                obscureText: obscureConform,
                suffix: InkWell(
                  onTap: () {
                    ref.read(obscureConfirmProvider.notifier).state = !obscureConform;
                  },
                  child: Icon(
                    obscureConform ? Icons.visibility : Icons.visibility_off,
                    color: colorScheme.onPrimary,
                  ),
                ),
              ),
              20.height(),
              CommonButton(
                minWidth: double.maxFinite,
                textTheme: textTheme,
                onPressed: () async {
                  if (_pass.text.trim() != _conformPass.text.trim()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Passwords do not match')),
                    );
                    return;
                  }

                  final authRepository = ref.read(authRepositoryProvider);
                  try {
                    await authRepository.signUpWithEmailAndPassword(
                      _email.text.trim(),
                      _pass.text.trim(),
                    );
                    // Handle successful registration (e.g., navigate to login or home screen)
                    context.pushReplacement(LoginScreen());
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      backgroundColor: Colors.greenAccent,
                      content: Text("Register Successfully!"),
                    ));
                  } on FirebaseAuthException catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(e.message ?? 'An error occurred'),
                    ));
                  }
                },
                name: "REGISTER",
              ),
              20.height(),
            ],
          ),
        ),
      ),
    );
  }
}
