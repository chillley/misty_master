import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:misty_master/constants/constants.dart';
import 'package:misty_master/model/vod_entity.dart';

import 'index_controller.dart';

class MainPage extends GetView<IndexController> {
  const MainPage({Key? key}) : super(key: key);

  AppBar _appBar() {
    return AppBar(
      backgroundColor: Colors.white,
      titleTextStyle: const TextStyle(
          color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.w400),
      title: const Text('首页'),
      actions: [
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            print('11');
          },
        )
      ],
      bottom: TabBar(
        isScrollable: true,
        labelColor: Colors.black,
        indicatorColor: Constants.defaultColor,
        controller: controller.tabController,
        onTap: (index) {
          controller.onChangeType(controller.tabList[index]);
        },
        tabs: controller.tabList.map((tab) => Tab(text: tab.typeName)).toList(),
      ),
    );
  }

  TabBarView _tabBarView() {
    return TabBarView(
      controller: controller.tabController,
      children: controller.tabList.asMap().entries.map((entry) {
        return _listItem();
      }).toList(),
    );
  }

  Widget _listItem() {
    return GetBuilder<IndexController>(
      id: 'tab_bar_list',
      builder: (controller) {
        return ListView.builder(
            itemCount: controller.vodList.length,
            itemBuilder: (_, index) {
              Vod_entity vod = controller.vodList[index];
              return Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                height: 100,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(
                      vod.vodPic ?? '',
                      width: 120.w,
                      fit: BoxFit.fitWidth,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(child: Text(vod.vodContent ?? ''))
                  ],
                ),
              );
            });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<IndexController>(
        id: 'tab_bar',
        init: controller,
        builder: (controller) {
          return Scaffold(
            appBar: _appBar(),
            body: _tabBarView(),
          );
        });
  }
}
