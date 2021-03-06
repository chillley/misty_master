import 'package:get/get.dart';

import 'package:misty_master/pages/index/index_page.dart';
import 'package:misty_master/pages/main/main_binding.dart';
import 'package:misty_master/pages/index/index_binding.dart';
import 'package:misty_master/pages/mine/mine_binding.dart';
import 'package:misty_master/pages/discover/discover_binding.dart';
import 'package:misty_master/pages/play/play_binding.dart';
import 'package:misty_master/pages/play/play_page.dart';

import 'package:misty_master/pages/search/search_binding.dart';
import 'package:misty_master/pages/search/search_page.dart';

import 'package:misty_master/pages/splash/splash_binding.dart';
import 'package:misty_master/pages/splash/splash_page.dart';

/// @description   GetX Routing profile
/// @date
/// @author xialei

class RouteConfig {
  static const String splash = "/splash";

  static const String index = "/index";

  static const String search = "/search";

  static const String play = "/play";

  static final List<GetPage> getPages = [
    GetPage(
      name: splash,
      page: () => const SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: index,
      page: () => IndexPage(),
      bindings: [
        IndexBinding(),
        MainBinding(),
        DiscoverBinding(),
        MineBinding()
      ],
    ),
    GetPage(
      name: search,
      page: () => const SearchPage(),
      binding: SearchBinding(),
    ),
    GetPage(
      name: play,
      page: () => const PlayPage(),
      binding: PlayBinding(),
    ),
  ];
}
