import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

export 'package:flutter_screenutil/flutter_screenutil.dart';

/// @description  screenAdaptationClass
/// @date 2021/10/22 13:50
/// @author xialei
class Screens {
  static final MediaQueryData mediaQueryData =
      MediaQueryData.fromWindow(window);

  static double get width => mediaQueryData.size.width;

  static double get height => mediaQueryData.size.height;

  static final EdgeInsets safePadding = mediaQueryData.padding;
  static final double statusBarHeight = safePadding.top;

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

final isMobile = Platform.isIOS || Platform.isAndroid;
