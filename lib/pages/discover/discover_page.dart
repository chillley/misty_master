import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:misty_master/components/misty_type_button.dart';
import 'package:misty_master/constants/constants.dart';
import 'package:misty_master/model/type_entity.dart';
import 'package:misty_master/pages/main/main_controller.dart';
import 'package:misty_master/routes/route_config.dart';
import 'package:misty_master/utils/tools_utils.dart';

import 'discover_controller.dart';

class DiscoverPage extends StatelessWidget {
  const DiscoverPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DiscoverController>();
    final mainController = Get.find<MainController>();
    final state = Get.find<DiscoverController>().state;

    Widget _typeRow() {
      List<Type_entity> typeList = [Type_entity(typeId: 0, typeName: "全部")];
      typeList.addAll(mainController.state.tabList);
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: typeList.map((type) {
            return MistyTypeButton(
              color: Constants.defaultColor,
              borRadiusNum: 5,
              text: isNullText(type.typeName),
              isActive: type.typeId == state.type1SelectIndex.value,
            );
          }).toList(),
        ),
      );
    }


    Widget _areaRow(){
      List areaList = [];
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: areaList.map((type) {
            return MistyTypeButton(
              color: Constants.defaultColor,
              borRadiusNum: 5,
              text: isNullText(type.typeName),
              isActive: type.typeId == state.type1SelectIndex.value,
            );
          }).toList(),
        ),
      );
    }

    Widget _filtrateContent() {
      return Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          _typeRow(),
          const SizedBox(
            height: 10,
          ),
          _areaRow(),
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 20.0,
          fontWeight: FontWeight.w400,
        ),
        title: const Text('发现'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Get.toNamed(RouteConfig.search);
            },
            icon: const Icon(Icons.search),
            color: Colors.black,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [_filtrateContent()],
        ),
      ),
    );
  }
}
