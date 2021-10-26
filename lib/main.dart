import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:misty_master/routes/route_config.dart';
import 'package:oktoast/oktoast.dart';
import 'package:misty_master/constants/constants.dart';
import 'package:misty_master/components/misty_gradient_button.dart';
import 'package:misty_master/utils/http_utils.dart';
import 'package:misty_master/constants/extension.dart';

void main() async {
  await _initDependencies();
  runApp(const MyApp());
}

Future _initDependencies() async {
  // 初始化适配UI
  Screens.init();
  // 初始化Dio请求
  await HttpUtils.init();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OKToast(
      position: const ToastPosition(
        align: Alignment.bottomCenter,
        offset: -72.0,
      ),
      child: GetMaterialApp(
        title: 'misty_master',
        initialRoute: RouteConfig.splash,
        getPages: RouteConfig.getPages,
      ),
    );
  }
}
