import 'package:fijkplayer/fijkplayer.dart';
import 'package:misty_master/constants/constants.dart';
import 'package:misty_master/fijkplayer_skin/fijkplayer_skin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:misty_master/utils/tools_utils.dart';

import 'play_controller.dart';

// 这里实现一个皮肤显示配置项
class PlayerShowConfig implements ShowConfigAbs {
  @override
  bool drawerBtn = true;
  @override
  bool nextBtn = true;
  @override
  bool speedBtn = true;
  @override
  bool topBar = true;
  @override
  bool lockBtn = true;
  @override
  bool autoNext = true;
  @override
  bool bottomPro = true;
  @override
  bool stateAuto = true;
  @override
  bool isAutoPlay = false;
}

class PlayPage extends StatelessWidget {
  const PlayPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PlayController>();
    final state = Get.find<PlayController>().state;

    ShowConfigAbs vCfg = PlayerShowConfig();

    // 剧集 tabCon
    List<Widget> _tabConList() {
      List<Widget> list = [];
      state.playerVodTabs.value.video!.asMap().keys.forEach((int tabIdx) {
        List<Widget> _playListButtons = state
            .playerVodTabs.value.video![tabIdx]!.list!
            .asMap()
            .keys
            .map((int activeIdx) {
          return ElevatedButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              elevation: MaterialStateProperty.all(0),
              backgroundColor: MaterialStateProperty.all(
                  tabIdx == state.curTabIdx.value &&
                          activeIdx == state.curActiveIdx.value
                      ? Constants.defaultColor
                      : Constants.defaultLightColor),
            ),
            onPressed: () async {
              controller.changePlayTheSource(tabIdx, activeIdx);
            },
            child: Text(
              state.playerVodTabs.value.video![tabIdx]!.list![activeIdx]!.name!,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          );
        }).toList();
        //
        list.add(
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: Wrap(
                alignment: WrapAlignment.start,
                crossAxisAlignment: WrapCrossAlignment.center,
                runSpacing: 3,
                spacing: 4,
                direction: Axis.horizontal,
                children: _playListButtons,
              ),
            ),
          ),
        );
      });
      return list;
    }

    // build 剧集
    Widget _playDrawer() {
      return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(24),
          child: AppBar(
              backgroundColor: Colors.white,
              automaticallyImplyLeading: false,
              primary: false,
              elevation: 0,
              title: Obx(() => (TabBar(
                    labelColor: Colors.black,
                    indicatorColor: Constants.defaultColor,
                    tabs: state.playerVodTabs.value.video!
                        .map((e) => Tab(text: e!.name!))
                        .toList(),
                    isScrollable: true,
                    controller: controller.tabController,
                  )))),
        ),
        body: Container(
          color: Colors.white,
          child: Obx(() => (TabBarView(
                controller: controller.tabController,
                children: _tabConList(),
              ))),
        ),
      );
    }

    Widget _videoPlayer() {
      return FijkView(
        height: 260,
        color: Colors.black,
        fit: FijkFit.cover,
        player: controller.player,
        panelBuilder: (
          FijkPlayer player,
          FijkData data,
          BuildContext context,
          Size viewSize,
          Rect texturePos,
        ) {
          /// 使用自定义的布局
          return Obx(() => (CustomFijkPanel(
                player: player,
                viewSize: viewSize,
                texturePos: texturePos,
                pageContent: context,
                playerTitle: isNullText(state.vod.value.vodName),
                showConfig: vCfg,
                videoFormat: state.playerVodTabs.value,
                onChangeVideo: controller.changePlayTheSource,
                curTabIdx: state.curTabIdx.value,
                curActiveIdx: state.curActiveIdx.value,
              )));
        },
      );
    }

    Widget _playerBody() {
      return Expanded(
        child: _playDrawer(),
      );
    }

    return Scaffold(
      body: Column(
        children: [_videoPlayer(), _playerBody()],
      ),
    );
  }
}
