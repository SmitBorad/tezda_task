import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension NavigationExtension on BuildContext {
  /// Push a new route onto the navigator stack
  Future<T?> push<T extends Object?>(Widget page) {
    return Navigator.of(this).push(
      MaterialPageRoute(builder: (_) => page),
    );
  }

  /// Replace the current route with a new one
  Future<T?> pushReplacement<T extends Object?, TO extends Object?>(Widget page) {
    return Navigator.of(this).pushReplacement(
      MaterialPageRoute(builder: (_) => page),
    );
  }

  /// Push a new route and remove all the previous routes
  Future<T?> pushAndRemoveUntil<T extends Object?>(Widget page, bool Function(Route<dynamic>) predicate) {
    return Navigator.of(this).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => page),
      predicate,
    );
  }

  /// Pop the current route
  void pop<T extends Object?>([T? result]) {
    Navigator.of(this).pop(result);
  }
}

///
extension SizedBoxes on int {
  height() {
    return SizedBox(
      height: toDouble().h,
    );
  }

  width() {
    return SizedBox(
      width: toDouble().w,
    );
  }
}
