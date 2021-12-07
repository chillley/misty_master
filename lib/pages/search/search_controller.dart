import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:misty_master/model/vod_entity.dart';
import 'package:misty_master/service/http.dart';

import 'search_state.dart';

class SearchController extends GetxController {
  final SearchState state = SearchState();

  TextEditingController textEditingController = TextEditingController();

  ScrollController scrollController = ScrollController();

  bool hasDeleteIcon = false;

  Future getVodList() async {
    if (state.vodListFinished) return;
    Map data = {
      'search': textEditingController.text,
      'limit': 10,
      'page': state.vodListPageIndex
    };
    Map<String, dynamic> mapRes = await Http.getVodList(data);
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
      update(['search-list']);
    }
  }

  Future resetVodList() async {
    state.vodList = [];
    state.vodListFinished = false;
    update(['search-list']);
  }

  Future loadMoreVodList() async {
    state.vodListPageIndex++;
    await getVodList();
  }

  @override
  void onReady() {
    super.onReady();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        loadMoreVodList();
      }
    });
  }
}
