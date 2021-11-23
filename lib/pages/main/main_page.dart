import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:misty_master/constants/constants.dart';
import 'package:misty_master/model/vod_entity.dart';
import 'package:misty_master/routes/route_config.dart';
import 'package:misty_master/utils/tools_utils.dart';
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
                child: ListView.builder(
                    controller: controller.scrollController,
                    itemCount: state.vodList.length,
                    itemBuilder: (_, index) {
                      Vod_entity vod = state.vodList[index];
                      List vodPlayFrom = vod.vodPlayFrom!.split("\$\$\$");
                      List<Widget> playbackSource = [
                        const Text('播放源:'),
                      ];
                      playbackSource.addAll(
                        vodPlayFrom.map(
                          (value) => Wrap(
                            runSpacing: 5,
                            spacing: 5,
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(3.0)),
                                child: Container(
                                  color: Constants.defaultColor,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 3),
                                  child: Text(
                                    value,
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 12.0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );

                      return GestureDetector(
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 10),
                          height: 160,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 100,
                                height: 160,
                                child: Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(6.0)),
                                      child: ExtendedImage.network(
                                        isNullText(vod.vodPic),
                                        width: 110,
                                        height: 160,
                                        cache: true,
                                        fit: BoxFit.cover,
                                        loadStateChanged:
                                            (ExtendedImageState state) {
                                          if (state.extendedImageLoadState ==
                                              LoadState.failed) {
                                            return Image.asset(
                                                "assets/images/no.png",
                                                fit: BoxFit.none);
                                          }
                                          if (state.extendedImageLoadState ==
                                              LoadState.loading) {
                                            return Image.asset(
                                                "assets/images/load.gif",
                                                fit: BoxFit.cover);
                                          }
                                        },
                                      ),
                                    ),
                                    Positioned(
                                      top: 5,
                                      left: 3,
                                      child: Row(
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(3.0)),
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 5,
                                                      vertical: 3),
                                              color: Colors.blueAccent,
                                              child: Text(
                                                isNullText(vod.vodYear),
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 10,
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 5),
                                          ClipRRect(
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(3.0)),
                                            child: Container(
                                              color: Colors.amber,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 5,
                                                      vertical: 3),
                                              child: Text(
                                                isNullText(vod.vodArea),
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 10,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 13,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      isNullText(vod.vodName),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          fontSize: 15, color: Colors.black),
                                    ),
                                    const SizedBox(
                                      height: 13,
                                    ),
                                    Text(
                                      isNullText(vod.vodContent),
                                      style: const TextStyle(
                                          fontSize: 12, color: Colors.black38),
                                      maxLines: 4,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(
                                      height: 13,
                                    ),
                                    Wrap(
                                      alignment: WrapAlignment.start,
                                      crossAxisAlignment:
                                          WrapCrossAlignment.center,
                                      runSpacing: 5,
                                      spacing: 5,
                                      children: playbackSource,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        onTap: (){
                          Get.toNamed(RouteConfig.play);
                        },
                      );
                    }),
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
