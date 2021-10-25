import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:misty_master/routes/route_config.dart';
import 'package:oktoast/oktoast.dart';
import 'package:misty_master/constants/constants.dart';
import 'package:misty_master/components/misty_gradient_button.dart';
import 'package:misty_master/utils/http_utils.dart';

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
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  onTap() {
    debugPrint("button click");
  }

  @override
  Widget build(BuildContext context) {
    return OKToast(
      position: const ToastPosition(
        align: Alignment.bottomCenter,
        offset: -72.0,
      ),
      child: GetMaterialApp(
        initialRoute: "/",
        getPages: RouteConfig.getPages,
        home: Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'You have pushed the button this many times:',
                ),
                const Text('1111'),
                GradientButton(
                  colors: const <Color>[
                    Constants.defaultColor,
                    Constants.defaultLightColor,
                  ],
                  child: const Text("Submit"),
                  onPressed: onTap,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
