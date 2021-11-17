import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:misty_master/constants/constants.dart';
import 'package:misty_master/routes/route_config.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(seconds: 1), () {
        Get.offNamed(RouteConfig.index);
      });
    });
    // TODO: implement build
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
