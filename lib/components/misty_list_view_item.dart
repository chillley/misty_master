import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:misty_master/constants/constants.dart';
import 'package:misty_master/model/vod_entity.dart';
import 'package:misty_master/routes/route_config.dart';
import 'package:misty_master/utils/tools_utils.dart';

class MistyListViewItem extends StatelessWidget {
  final ScrollController scrollController;
  final List<Vod_entity> vodList;

  const MistyListViewItem(
      {Key? key, required this.scrollController, required this.vodList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        controller: scrollController,
        itemCount: vodList.length,
        itemBuilder: (_, index) {
          Vod_entity vod = vodList[index];
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
                    borderRadius: const BorderRadius.all(Radius.circular(3.0)),
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

          return InkWell(
            child: Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
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
                          borderRadius:
                              const BorderRadius.all(Radius.circular(6.0)),
                          child: ExtendedImage.network(
                            isNullText(vod.vodPic),
                            width: 110,
                            height: 160,
                            cache: true,
                            fit: BoxFit.cover,
                            loadStateChanged: (ExtendedImageState state) {
                              if (state.extendedImageLoadState ==
                                  LoadState.failed) {
                                return Image.asset("assets/images/no.png",
                                    fit: BoxFit.none);
                              }
                              if (state.extendedImageLoadState ==
                                  LoadState.loading) {
                                return Image.asset("assets/images/load.gif",
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
            ),
            onTap: () {
              Get.toNamed(RouteConfig.play, arguments: vod.vodId);
            },
          );
        });
  }
}
