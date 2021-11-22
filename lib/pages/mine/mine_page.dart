import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'mine_controller.dart';

class MinePage extends StatelessWidget {
  const MinePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MineController>();
    final state = Get.find<MineController>().state;

    return Container();
  }
}
