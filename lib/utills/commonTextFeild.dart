import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tezda_smit_task/utills/AppColors.dart';

Widget CommonTextFeild({
  required TextTheme textTheme,
  required TextEditingController controller,
  required String hintText,
  String? labelText,
  TextInputType? keyboardType,
  ValueChanged<String>? onChanged,
  List<TextInputFormatter>? inputFormatters,
  String? Function(String?)? validator,
  TextInputAction? textInputAction,
  Widget? suffix,
  Widget? prefix,
  bool obscureText = false,
}) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 12.h),
    child: TextFormField(
      controller: controller,
      textInputAction: textInputAction,
      cursorColor: colorPrimary,
      inputFormatters: inputFormatters,
      onChanged: onChanged,
      keyboardType: keyboardType,
      validator: validator,
      style: textTheme.displaySmall,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: textTheme.bodyLarge,
        labelText: labelText,
        labelStyle: textTheme.displaySmall,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        suffixIcon: suffix,
        prefix: prefix,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: colorPrimary),
          borderRadius: BorderRadius.circular(4.r),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: colorPrimary),
          borderRadius: BorderRadius.circular(4.r),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(4.r),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(4.r),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(4.r),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(4.r),
        ),
      ),
    ),
  );
}
