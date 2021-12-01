import 'package:get/get.dart';
import 'package:misty_master/model/type_entity.dart';
import 'package:misty_master/pages/main/main_controller.dart';
import 'package:misty_master/service/http.dart';

import 'discover_state.dart';

class DiscoverController extends GetxController {
  final DiscoverState state = DiscoverState();
  final mainController = Get.find<MainController>();

  Future getLevel2TypeList(id) async {
    Map params = {'id': id};
    Map<String, dynamic> mapRes = await Http.getLevel2TypeList(params);
    List<Type_entity> data = mapRes['data'];
    List<Type_entity> type2List =
        data.map((row) => Type_entity.fromJson(row)).toList();
    type2List.insert(0, Type_entity(typeId: 0, typeName: '全部'));
    state.type2List.value = type2List;
    print(mainController.state.tabList[0].typeId);
  }

  resetOtherTypeSelectIndex() {}

  onChangeType1SelectIndex(int id) async {
    state.type1SelectIndex.value = id;
    await getLevel2TypeList(id);
  }

  @override
  void onReady() async {
    // TODO: implement onReady
    await getLevel2TypeList(mainController.state.tabList[0].typeId);
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
