import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:misty_master/components/double_tap_back_exit_app.dart';
import 'package:misty_master/pages/index/index_controller.dart';
import 'package:misty_master/constants/constants.dart';
import 'package:misty_master/pages/index/main_page.dart';

class IndexPage extends GetView<IndexController> {
  const IndexPage({Key? key}) : super(key: key);

  /// 底部导航栏
  BottomNavigationBar _bottomNavigationBar() {
    List<BottomNavigationBarItem> bottomNavigationItems = controller
        .bottomNavigation
        .map((item) => BottomNavigationBarItem(
            label: item['label'], icon: Icon(item['icon'])))
        .toList();
    return BottomNavigationBar(
      onTap: (index) {
        controller.onChangePageIndex(index);
      },
      currentIndex: controller.pageIndex,
      selectedIconTheme: const IconThemeData(color: Constants.defaultColor),
      selectedItemColor: Constants.defaultColor,
      iconSize: 21.0,
      selectedFontSize: 12.sp,
      unselectedFontSize: 11.sp,
      items: bottomNavigationItems,
    );
  }

  /// 导航对应页面
  PageView _pageView() {
    return PageView(
      children: const [MainPage()],
    );
  }

  @override
  Widget build(BuildContext context) {
    // 注入controller
    return DoubleTapBackExitApp(
      child: Scaffold(
        body: _pageView(),
        bottomNavigationBar: GetBuilder<IndexController>(
          builder: (controller) {
            return _bottomNavigationBar();
          },
        ),
      ),
    );
  }
}
