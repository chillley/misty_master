import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:misty_master/constants/constants.dart';
import 'package:misty_master/model/vod_entity.dart';
import 'package:misty_master/utils/tools_utils.dart';

import 'search_controller.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SearchController>();
    final state = Get
        .find<SearchController>()
        .state;

    Widget _listItem() {
      return GetBuilder<SearchController>(
          id: 'search-item-list',
          builder: (controller) {
            return Container(
              color: Colors.white,
              child: ListView.builder(
                  controller: controller.scrollController,
                  itemCount: state.vodList.length,
                  itemBuilder: (_, index) {
                    Vod_entity vod = state.vodList[index];
                    List vodPlayFrom = vod.vodPlayFrom!.split("\$\$\$");
                    List<Widget> playbackSource = [
                      const Text('播放源:'),
                      const SizedBox(
                        width: 5,
                      )
                    ];
                    playbackSource.addAll(
                      vodPlayFrom.map(
                            (value) =>
                            Wrap(
                              runSpacing: 5,
                              spacing: 5,
                              children: [
                                ClipRRect(
                                  borderRadius:
                                  const BorderRadius.all(Radius.circular(3.0)),
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
                                const SizedBox(
                                  width: 5,
                                )
                              ],
                            ),
                      ),
                    );
                    return Container(
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
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(3.0)),
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5, vertical: 3),
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
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(3.0)),
                                        child: Container(
                                          color: Colors.amber,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5, vertical: 3),
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
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  runSpacing: 5,
                                  spacing: 5,
                                  children: playbackSource,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  }),
            );
          });
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leadingWidth: 40.0,
        leading: IconButton(
          color: Colors.black,
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
        title: Container(
          padding: const EdgeInsets.all(5),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                      border: Border.all(color: Colors.black12, width: 1.0),
                      color: Colors.white10),
                  height: 42,
                  child: TextField(
                    controller: controller.textEditingController,
                    textInputAction: TextInputAction.search,
                    keyboardType: TextInputType.text,
                    maxLines: 1,
                    cursorColor: Constants.defaultColor,
                    autofocus: true,
                    decoration: const InputDecoration(
                      contentPadding:
                      EdgeInsets.symmetric(vertical: 4, horizontal: 1.0),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 5, top: 5, right: 10),
                        child: Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                      ),
                      prefixIconConstraints:
                      BoxConstraints(maxWidth: 30, minHeight: 25),
                      border: InputBorder.none,
                      hintText: '请输入剧名等关键字',
                      hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    style: const TextStyle(fontSize: 15, color: Colors.black),
                    onChanged: (value) {
                      if (value.isEmpty) {
                        controller.resetVodList();
                      }
                    },
                    onEditingComplete: () {
                      print('输入完成');
                      print(controller.textEditingController.text);
                      controller.getVodList();
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      body: _listItem(),
    );
  }
}
