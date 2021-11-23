import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'play_controller.dart';

class PlayPage extends StatelessWidget {
  const PlayPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PlayController>();
    final state = Get.find<PlayController>().state;

    return Scaffold(
      appBar: AppBar(
        title: const Text('播放页面'),
      ),
    );
  }
}
