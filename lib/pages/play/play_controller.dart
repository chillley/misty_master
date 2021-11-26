import 'package:fijkplayer/fijkplayer.dart';
import 'package:misty_master/fijkplayer_skin/schema.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:misty_master/model/vod_entity.dart';
import 'package:misty_master/service/http.dart';

import 'play_state.dart';

class PlayController extends GetxController with SingleGetTickerProviderMixin {
  final PlayState state = PlayState();
  final FijkPlayer player = FijkPlayer();

  late TabController tabController = TabController(
      initialIndex: 0,
      length: state.playerVodTabs.value.video!.length,
      vsync: this);

  Future getVodDetails(id) async {
    Map data = {'id': id};
    Map<String, dynamic> mapRes = await Http.getVodDetails(data);
    if (mapRes['success'] == 1) {
      Map<String, dynamic> data = mapRes['data'];
      state.vod.value = Vod_entity.fromJson(data);
    }
  }

  Future getVodPlayVideoSourceFormat(id) async {
    Map data = {'id': id};
    Map<String, dynamic> mapRes = await Http.getVodPlayVideoSourceFormat(data);
    if (mapRes['success'] == 1) {
      Map<String, dynamic> videoList = {"video": mapRes['data']};
      state.playerVodTabs.value = VideoSourceFormat.fromJson(videoList);
    }
  }

  Future getFqVideosPlayerListByFq(fq) async {
    Map data = {'fq': fq};
    String url = '';
    Map<String, dynamic> mapRes = await Http.getFqVideosPlayerListByFq(data);
    if (mapRes['success'] == 1) {
      url = mapRes['data'];
    }
    return url;
  }

  changePlayTheSource(tabIdx, activeIdx) async {
    state.curTabIdx.value = tabIdx;
    state.curActiveIdx.value = activeIdx;

    String nextVideoUrl =
        state.playerVodTabs.value.video![tabIdx]!.list![activeIdx]!.url!;

    String? fq = state.playerVodTabs.value.video![state.curTabIdx.value]!
        .list![state.curActiveIdx.value]!.fq;
    if (nextVideoUrl == 'fq') {
      nextVideoUrl = await getFqVideosPlayerListByFq(fq);
    }

    if (player.value.state == FijkState.completed) {
      await player.stop();
    }
    await player.reset().then((_) async {
      player.setDataSource(nextVideoUrl, autoPlay: true);
    });
  }



  @override
  void onReady() async {
    // TODO: implement onReady
    var id = Get.arguments;
    await getVodDetails(id);
    await getVodPlayVideoSourceFormat(id);
    tabController = TabController(
      length: state.playerVodTabs.value.video!.length,
      vsync: this,
    );
    String nextVideoUrl = state.playerVodTabs.value
        .video![state.curTabIdx.value]!.list![state.curActiveIdx.value]!.url!;
    String? fq = state.playerVodTabs.value.video![state.curTabIdx.value]!
        .list![state.curActiveIdx.value]!.fq;
    if (nextVideoUrl == 'fq') {
      nextVideoUrl = await getFqVideosPlayerListByFq(fq);
    }
    if (player.value.state == FijkState.completed) {
      await player.stop();
    }
    await player.reset().then((_) async {
      player.setDataSource(nextVideoUrl, autoPlay: true);
    });
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    player.release();
    super.onClose();
  }
}
