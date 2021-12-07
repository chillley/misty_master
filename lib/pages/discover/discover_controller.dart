import 'package:common_utils/common_utils.dart';
import 'package:get/get.dart';
import 'package:misty_master/model/type_entity.dart';
import 'package:misty_master/model/vod_entity.dart';
import 'package:misty_master/pages/main/main_controller.dart';
import 'package:misty_master/service/http.dart';
import 'package:flutter/material.dart';

import 'discover_state.dart';

class DiscoverController extends GetxController {
  final DiscoverState state = DiscoverState();
  final mainController = Get.find<MainController>();

  ScrollController singleScrollController = ScrollController();

  late Map typeExtend;

  Future getLevel2TypeList(id) async {
    Map params = {'id': id};
    Map<String, dynamic> mapRes = await Http.getLevel2TypeList(params);
    List data = mapRes['data'];
    List<Type_entity> type2List =
        data.map((row) => Type_entity.fromJson(row)).toList();
    type2List.insert(0, Type_entity(typeId: 0, typeName: '全部'));
    state.type2List.value = type2List;
  }

  Future getTypeData() async {
    Map params = {
      'area': state.areaSelected.value == '全部' ? '' : state.areaSelected.value,
      'classTag':
          state.classSelected.value == '全部' ? '' : state.classSelected.value,
      'lang': state.languageSelected.value == '全部'
          ? ''
          : state.languageSelected.value,
      'year': state.yearSelected.value == '全部' ? '' : state.yearSelected.value,
    };
    if (state.type2SelectId.value != 0) {
      params['type'] = state.type2SelectId.value;
    }
    params['type1'] = state.type1SelectId.value;
    params['limit'] = 24;
    params['page'] = state.vodListPageIndex;
    Map<String, dynamic> mapRes = await Http.getTypeData(params);
    if (mapRes['success'] == 1) {
      Map<String, dynamic> data = mapRes['data'];
      state.vodListCount = data['count'];
      List rows = data['rows'];
      if (state.vodList.length < state.vodListCount) {
        List<Vod_entity> vodList =
            rows.map((row) => Vod_entity.fromJson(row)).toList();
        state.vodList.addAll(vodList);
      } else {
        state.vodListFinished = true;
        if (state.vodListCount == 0) {
          state.vodList = [];
        }
      }
      update(['discover-list']);
    }
  }

  resetAllFilter() {
    state.type2SelectId.value = 0;
    state.classSelected.value = '全部';
    state.areaSelected.value = '全部';
    state.yearSelected.value = '全部';
    state.languageSelected.value = '全部';
  }

  onChangeType1SelectId(int id) async {
    state.type1SelectId.value = id;
    await getLevel2TypeList(id);
    resetAllFilter();
    setFilterData(state.type1SelectId.value);
    state.vodListPageIndex = 1;
    await getTypeData();
  }

  onChangeType2SelectId(id) async {
    state.type2SelectId.value = id;
    state.vodList = [];
    state.vodListPageIndex = 1;
    await getTypeData();
  }

  onChangeClass(String classSelected) async {
    state.classSelected.value = classSelected;
    state.vodList = [];
    state.vodListPageIndex = 1;
    await getTypeData();
  }

  onChangeArea(area) async {
    state.areaSelected.value = area;
    state.vodList = [];
    state.vodListPageIndex = 1;
    await getTypeData();
  }

  onChangeYear(year) async {
    state.yearSelected.value = year;
    state.vodList = [];
    state.vodListPageIndex = 1;
    await getTypeData();
  }

  onChangeLanguage(language) async {
    state.languageSelected.value = language;
    state.vodList = [];
    state.vodListPageIndex = 1;
    await getTypeData();
  }

  setFilterData(int id) {
    Type_entity selectedTab = mainController.state.tabList.firstWhere((tab) {
      return tab.typeId == id;
    }, orElse: () {
      return mainController.state.tabList[0];
    });

    Map typeExtend = JsonUtil.getObj(selectedTab.typeExtend, (v) => v)!;

    List<String> classList = typeExtend['class']!.split(',');
    classList.insert(0, '全部');
    state.classList.value = classList;

    List<String> areaList = typeExtend['area']!.split(',');
    areaList.insert(0, '全部');
    state.areaList.value = areaList;

    List<String> yearList = typeExtend['year']!.split(',');
    yearList.insert(0, '全部');
    state.yearList.value = yearList;

    List<String> languageList = typeExtend['lang']!.split(',');
    languageList.insert(0, '全部');
    state.languageList.value = languageList;
  }

  @override
  void onReady() async {
    Type_entity selectedTab = mainController.state.tabList[0];

    await getLevel2TypeList(selectedTab.typeId);

    setFilterData(selectedTab.typeId!);

    await getTypeData();

    singleScrollController.addListener(() async {
      if (singleScrollController.position.pixels ==
          singleScrollController.position.maxScrollExtent) {
        state.vodListPageIndex++;
        await getTypeData();
      }
    });
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
