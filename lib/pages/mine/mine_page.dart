import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:misty_master/routes/route_config.dart';

import 'mine_controller.dart';

class MinePage extends StatelessWidget {
  const MinePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MineController>();
    final state = Get.find<MineController>().state;

    _topContent() {
      return Container(
        color: Colors.white,
        height: 100,
        child: Row(),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0,
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 20.0,
          fontWeight: FontWeight.w400,
        ),
        title: const Text('我的'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Get.toNamed(RouteConfig.search);
            },
            icon: const Icon(Icons.search),
            color: Colors.black,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [_topContent()],
        ),
      ),
    );
  }
}
