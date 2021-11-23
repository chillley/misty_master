import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'search_state.dart';

class SearchController extends GetxController {
  final SearchState state = SearchState();

  TextEditingController textEditingController = TextEditingController();

  bool hasDeleteIcon = false;


  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
