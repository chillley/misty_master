import 'package:fijkplayer_skin/schema.dart';
import 'package:get/get.dart';
import 'package:misty_master/model/vod_entity.dart';

class PlayState {
  Rx<Vod_entity> vod =
      Rx<Vod_entity>(Vod_entity(typeId1: 1, typeId: 1, vodId: 1, groupId: 1));

  Rx<int> curTabIdx = Rx<int>(0);
  Rx<int> curActiveIdx = Rx<int>(0);

  Rx<VideoSourceFormat> playerVodTabs =
      Rx<VideoSourceFormat>(VideoSourceFormat(video: []));
}
