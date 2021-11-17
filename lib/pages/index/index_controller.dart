import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:misty_master/model/type_entity.dart';
import 'package:misty_master/model/vod_entity.dart';
import 'package:misty_master/service/http.dart';

class IndexController extends GetxController with SingleGetTickerProviderMixin {
  List<Map<String, dynamic>> bottomNavigation = [
    {'label': '首页', 'icon': Icons.home},
    {'label': '发现', 'icon': Icons.find_in_page},
    {'label': '我的', 'icon': Icons.person},
  ];

  int pageIndex = 0;

  List<Type_entity> tabList = [];

  List<Vod_entity> vodList = [];

  late TabController tabController =
      TabController(initialIndex: 0, length: tabList.length, vsync: this);

  void onChangePageIndex(int index) {
    print(index);
    pageIndex = index;
    update();
  }

  @override
  void onInit() async {
    super.onInit();
    // TODO: implement onInit
    await getLevel1TypeList();
    tabController =
        TabController(initialIndex: 0, length: tabList.length, vsync: this);
    tabController.addListener(() {
      getVodListByType(tabList[tabController.index].typeId);
    });
    await getVodListByType(tabList[0].typeId);
  }

  Future onChangeType(Type_entity tab) async {
    await getVodListByType(tab.typeId);
  }

  Future getLevel1TypeList() async {
    Map<String, dynamic> mapRes = await Http.getLevel1TypeList();
    if (mapRes['success'] == 1) {
      List data = mapRes['data'];
      tabList = data.map((row) => Type_entity.fromJson(row)).toList();
      update(['tab_bar']);
    }
  }

  Future getVodListByType(type) async {
    Map data = {'type': type, 'limit': 10};
    Map<String, dynamic> mapRes = await Http.getVodListByType(data);
    if (mapRes['success'] == 1) {
      Map data = mapRes['data'];
      List rows = data['rows'];
      vodList = rows.map((row) => Vod_entity.fromJson(row)).toList();
      update(['tab_bar_list']);
    }
  }
}
