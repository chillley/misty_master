import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:misty_master/constants/constants.dart';
import 'package:misty_master/routes/route_config.dart';

import 'splash_controller.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SplashController>();
    final state = Get.find<SplashController>().state;
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(seconds: 2), () {
        Get.offNamed(RouteConfig.index);
      });
    });
    return AnnotatedRegion(
      value: lightSystemUiOverlayStyle,
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              color: Constants.splashPageBgc,
              child: Image.asset(
                "assets/images/splash.png",
                fit: BoxFit.fitHeight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
