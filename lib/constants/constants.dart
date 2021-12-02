export 'top_const.dart';
export 'extension.dart';

import 'dart:ui';

import 'package:flutter/material.dart';

class Constants {


  static const Color splashPageBgc = Color(0xF21C2F54);

  // 主题颜色
  static const Color defaultColor = Color(0xFFFE5767);

  // 浅色主题颜色
  static const Color defaultLightColor = Color(0xFFFFABB8);

  static final MediaQueryData mediaQueryData =
      MediaQueryData.fromWindow(window);

  static final Size screenSize = mediaQueryData.size;

  static final double screenWidth = screenSize.width;

  static final double screenHeight = screenSize.height;

  const Constants._();

}
