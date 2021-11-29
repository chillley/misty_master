import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:misty_master/model/type_entity.dart';

class DiscoverState {
  Rx<int> type1SelectIndex = Rx<int>(0);
  Rx<int> type2SelectIndex = Rx<int>(0);
  RxList<Type_entity> type2List = RxList<Type_entity>([]);

  DiscoverState() {
    ///Initialize variables
  }
}
