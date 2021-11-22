import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'discover_controller.dart';

class DiscoverPage extends StatelessWidget {
  const DiscoverPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DiscoverController>();
    final state = Get.find<DiscoverController>().state;

    return Container();
  }
}
