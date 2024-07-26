import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tezda_smit_task/utills/AppColors.dart';

MaterialButton CommonButton(
    {required TextTheme textTheme, ShapeBorder? shape, double? minWidth, required void Function()? onPressed, required String name, TextStyle? style, Color? color}) {
  return MaterialButton(
    minWidth: minWidth,
    onPressed: onPressed,
    shape: shape ??
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.r),
        ),
    color: color ?? colorPrimary,
    padding: EdgeInsets.symmetric(vertical: 12.h),
    child: Text(
      name,
      style: style ?? textTheme.displaySmall,
    ),
  );
}
