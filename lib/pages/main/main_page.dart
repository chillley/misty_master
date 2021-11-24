import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:misty_master/components/misty_list_view_item.dart';
import 'package:misty_master/constants/constants.dart';
import 'package:misty_master/routes/route_config.dart';
import 'main_controller.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MainController>();
    final state = Get.find<MainController>().state;

    Widget _listItem() {
      return GetBuilder<MainController>(
          id: 'item-list',
          builder: (controller) {
            return Container(
              color: Colors.white,
              child: RefreshIndicator(
                color: Constants.defaultColor,
                onRefresh: () async {
                  await controller.onRefresh();
                },
                child: MistyListViewItem(
                  scrollController: controller.scrollController,
                  vodList: state.vodList,
                ),
              ),
            );
          });
    }

    AppBar _appBar() {
      return AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 20.0,
          fontWeight: FontWeight.w400,
        ),
        title: const Text('首页'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Get.toNamed(RouteConfig.search);
            },
            icon: const Icon(Icons.search),
            color: Colors.black,
          )
        ],
        bottom: TabBar(
          isScrollable: true,
          labelColor: Colors.black,
          indicatorColor: Constants.defaultColor,
          controller: controller.tabController,
          tabs: state.tabList.map((tab) => Tab(text: tab.typeName)).toList(),
        ),
      );
    }

    TabBarView _tabBarView() {
      return TabBarView(
        controller: controller.tabController,
        children: state.tabList.map((entry) {
          return _listItem();
        }).toList(),
      );
    }

    return GetBuilder<MainController>(builder: (controller) {
      return Scaffold(
        appBar: _appBar(),
        body: _tabBarView(),
      );
    });
  }
}
