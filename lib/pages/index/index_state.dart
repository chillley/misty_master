import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IndexState {
  late List<Map<String, dynamic>> bottomNavigation;

  var  pageIndex = 0.obs;

  IndexState() {
    ///Initialize variables
    bottomNavigation = [
      {'label': '首页', 'icon': Icons.home},
      {'label': '发现', 'icon': Icons.find_in_page},
      {'label': '我的', 'icon': Icons.person},
    ];
  }
}
