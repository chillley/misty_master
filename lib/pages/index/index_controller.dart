import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index_state.dart';

class IndexController extends GetxController {
  final IndexState state = IndexState();

  late PageController pageController = PageController(
    initialPage: state.pageIndex.value,
    keepPage: false,
  );

  void onChangePageIndex(int index) {
    state.pageIndex.value = index;
    pageController.jumpToPage(state.pageIndex.value);
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
