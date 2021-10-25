import 'package:get/get.dart';
import 'package:misty_master/pages/discover_page.dart';
import 'package:misty_master/pages/index_page.dart';
import 'package:misty_master/pages/mine_page.dart';
import 'package:misty_master/pages/splash_page.dart';

/// @description   GetX Routing profile
/// @date   
/// @author xialei


class RouteConfig {
  static const String splash = "/splash";

  static const String index = "/index";

  static const String discover = "/discover";

  static const String mine = "/mine";

  static final List<GetPage> getPages = [
    GetPage(name: splash, page: () => const SplashPage()),
    GetPage(name: index, page: () => const IndexPage()),
    GetPage(name: discover, page: () => const DiscoverPage()),
    GetPage(name: mine, page: () => const MinePage())
  ];
}
