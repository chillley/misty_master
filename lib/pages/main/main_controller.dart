import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:misty_master/constants/extension.dart';
import 'package:misty_master/model/type_entity.dart';
import 'package:misty_master/model/vod_entity.dart';
import 'package:misty_master/service/http.dart';

import 'main_state.dart';

class MainController extends GetxController with SingleGetTickerProviderMixin {
  final MainState state = MainState();

  late TabController tabController =
      TabController(initialIndex: 0, length: state.tabList.length, vsync: this);

  ScrollController scrollController = ScrollController();

  Future<void> onRefresh() async {
    state.vodList = [];
    state.vodListPageIndex = 1;
    state.vodListFinished = false;
    await getVodListByType(state.tabList[tabController.index].typeId);
    "数据刷新完成".toast();
  }

  Future getVodListByType(type) async {
    if (state.vodListFinished) return;
    Map data = {'type': type, 'limit': 10, 'page': state.vodListPageIndex};
    Map<String, dynamic> mapRes = await Http.getVodListByType(data);
    if (mapRes['success'] == 1) {
      Map data = mapRes['data'];
      state.vodListCount = data['count'];
      List rows = data['rows'];
      if (state.vodList.length < state.vodListCount) {
        state.vodList
            .addAll(rows.map((row) => Vod_entity.fromJson(row)).toList());
      } else {
        state.vodListFinished = true;
        if (state.vodListCount == 0) {
          state.vodList = [];
        }
      }
      update(['item-list']);
    }
  }

  Future getLevel1TypeList() async {
    Map<String, dynamic> mapRes = await Http.getLevel1TypeList();
    if (mapRes['success'] == 1) {
      List data = mapRes['data'];
      state.tabList = data.map((row) => Type_entity.fromJson(row)).toList();
    }
  }

  Future loadMoreVodListByType() async {
    state.vodListPageIndex++;
    await getVodListByType(state.tabList[tabController.index].typeId);
  }

  @override
  void onReady() async {
    // TODO: implement onReady
    super.onReady();
    await getLevel1TypeList();

    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        loadMoreVodListByType();
      }
    });
    tabController = TabController(
        initialIndex: 0, length: state.tabList.length, vsync: this);
    tabController.addListener(() {
      state.vodList = [];
      state.vodListPageIndex = 1;
      state.vodListFinished = false;
      getVodListByType(state.tabList[tabController.index].typeId);
    });
    await getVodListByType(state.tabList[0].typeId);
    update();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
