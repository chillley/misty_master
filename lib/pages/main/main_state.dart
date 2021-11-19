import 'package:misty_master/model/type_entity.dart';
import 'package:misty_master/model/vod_entity.dart';

class MainState {
  /// 头部tabList
  late List<Type_entity> tabList;

  /// 视频列表list
  late List<Vod_entity> vodList;

  /// 视频列表 分页Index
  late int vodListPageIndex;

  /// 视频列表 总条数
  late int vodListCount;

  /// 视频是否加载完毕
  late bool vodListFinished;

  MainState() {
    ///Initialize variables
    tabList = [];

    vodList = [];

    vodListPageIndex = 1;

    vodListCount = 0;

    vodListFinished = false;
  }
}
