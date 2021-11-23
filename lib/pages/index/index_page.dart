import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:misty_master/components/double_tap_back_exit_app.dart';
import 'package:misty_master/constants/constants.dart';
import 'package:misty_master/pages/discover/discover_page.dart';
import 'package:misty_master/pages/main/main_page.dart';
import 'package:misty_master/pages/mine/mine_page.dart';

import 'index_controller.dart';

class IndexPage extends StatelessWidget {
  IndexPage({Key? key}) : super(key: key);

  final controller = Get.find<IndexController>();
  final state = Get.find<IndexController>().state;

  /// 导航对应页面
  PageView _pageView() {
    return PageView(
      physics: const NeverScrollableScrollPhysics(),
      controller: controller.pageController,
      children: const [MainPage(), DiscoverPage(), MinePage()],
    );
  }

  /// 底部导航栏
  _bottomNavigationBar() {
    List<BottomNavigationBarItem> bottomNavigationItems = state.bottomNavigation
        .map((item) => BottomNavigationBarItem(
            label: item['label'], icon: Icon(item['icon'])))
        .toList();
    return Obx(
      () => BottomNavigationBar(
        onTap: (index) {
          controller.onChangePageIndex(index);
        },
        type: BottomNavigationBarType.fixed,
        currentIndex: state.pageIndex.value,
        selectedIconTheme: const IconThemeData(color: Constants.defaultColor),
        selectedItemColor: Constants.defaultColor,
        iconSize: 21.0,
        selectedFontSize: 12.0,
        unselectedFontSize: 11.0,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        items: bottomNavigationItems,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DoubleTapBackExitApp(
      child: Scaffold(
        body: _pageView(),
        bottomNavigationBar: _bottomNavigationBar(),
      ),
    );
  }
}
