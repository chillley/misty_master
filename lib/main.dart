import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:misty_master/pages/splash/splash_binding.dart';
import 'package:misty_master/pages/splash/splash_page.dart';
import 'package:misty_master/routes/route_config.dart';
import 'package:oktoast/oktoast.dart';
import 'package:misty_master/constants/constants.dart';
import 'package:misty_master/utils/http_utils.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

void main() async {
  await _initDependencies();
  runApp(const MyApp());
}

Future _initDependencies() async {
  // 初始化适配UI
  Screens.init();
  // 初始化Dio请求
  await HttpUtils.init();
  Get.changeTheme(ThemeData(
    primaryColor: Constants.defaultColor,
    colorScheme:
        ColorScheme.fromSwatch().copyWith(secondary: Constants.defaultColor),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  void hideKeyboard(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus!.unfocus();
    }
  }

  void _subscribeConnectivityChange() {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      switch (result) {
        case ConnectivityResult.wifi:
          "您正在使用WiFi网络".toast();
          break;
        case ConnectivityResult.mobile:
          "您正在使用移动网络".toast();
          break;
        case ConnectivityResult.none:
          "您已断开网络".toast();
          break;
        case ConnectivityResult.ethernet:
          "您正在使用以太网".toast();
          break;
      }
    });
  }

  GetMaterialApp _getMaterialApp() {
    return GetMaterialApp(
      title: '蒙蒙的休息室',
      initialRoute: '/',
      initialBinding: SplashBinding(),
      navigatorObservers: [GetObserver(), FlutterSmartDialog.observer],
      builder: (context, child) {
        return FlutterSmartDialog(
          child: OKToast(
            position: const ToastPosition(
              align: Alignment.bottomCenter,
              offset: -72.0,
            ),
            child: Scaffold(
              // 点击空白处关闭键盘
              body: GestureDetector(
                onTap: () {
                  hideKeyboard(context);
                },
                child: child,
              ),
            ),
          ),
        );
      },
      getPages: RouteConfig.getPages,
      home: const SplashPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    FlutterSmartDialog.monitor();
    if (isMobile) {
      _subscribeConnectivityChange();
    }
    return _getMaterialApp();
  }
}
