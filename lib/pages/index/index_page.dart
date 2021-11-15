import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:misty_master/components/double_tap_back_exit_app.dart';
import 'package:misty_master/pages/index/index_controller.dart';

class IndexPage extends GetView<IndexController> {
  const IndexPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 注入controller
    Get.put(IndexController());

    return DoubleTapBackExitApp(
      child: Scaffold(
        body: Column(
          children: const [Text('data')],
        ),
      ),
    );
  }
}
