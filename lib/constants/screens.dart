import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

export 'package:flutter_screenutil/flutter_screenutil.dart';

/// @description  screenAdaptationClass
/// @date 2021/10/22 13:50
/// @author xialei
class Screens {
  static MediaQueryData get mediaQuery => MediaQueryData.fromWindow(ui.window);

  static double get width => mediaQuery.size.width;

  static double get height => mediaQuery.size.height;

  /// Initialize the screen adaptation method
  static void init() {
    ScreenUtil.init(
      BoxConstraints(maxWidth: width, maxHeight: height),
      designSize: const Size(375, 812),
      orientation: Orientation.portrait,
    );
    ScreenUtil().setSp(14);
  }
}
