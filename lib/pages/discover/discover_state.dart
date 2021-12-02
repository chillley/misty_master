import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:misty_master/model/type_entity.dart';
import 'package:misty_master/model/vod_entity.dart';

class DiscoverState {
  Rx<int> type1SelectId = Rx<int>(1);
  Rx<int> type2SelectId = Rx<int>(0);

  RxList<Type_entity> type2List = RxList<Type_entity>([]);

  RxList<Vod_entity> vodList = RxList<Vod_entity>([]);

  Rx<String> classSelected = Rx<String>("全部");
  Rx<String> areaSelected = Rx<String>("全部");
  Rx<String> yearSelected = Rx<String>("全部");
  Rx<String> languageSelected = Rx<String>("全部");
  RxList<String> classList = RxList<String>([]);
  RxList<String> areaList = RxList<String>([]);
  RxList<String> yearList = RxList<String>([]);
  RxList<String> languageList = RxList<String>([]);

  /// 视频列表 分页Index
  late int vodListPageIndex;

  /// 视频列表 总条数
  late int vodListCount;

  /// 视频是否加载完毕
  late bool vodListFinished;

  DiscoverState() {
    vodListPageIndex = 1;

    vodListCount = 0;

    vodListFinished = false;

    ///Initialize variables
  }
}
