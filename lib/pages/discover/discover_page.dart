import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:misty_master/components/misty_type_button.dart';
import 'package:misty_master/constants/constants.dart';
import 'package:misty_master/model/type_entity.dart';
import 'package:misty_master/model/vod_entity.dart';
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
      List<Type_entity> typeList = mainController.state.tabList.where((type) {
        return type.typeId == 1 || type.typeId == 2 || type.typeId == 4;
      }).toList();
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Obx(
          () => Row(
            children: typeList.map((type) {
              return MistyTypeButton(
                color: Constants.defaultColor,
                borRadiusNum: 5,
                text: isNullText(type.typeName),
                isActive: type.typeId == state.type1SelectId.value,
                onTap: () {
                  controller.onChangeType1SelectId(type.typeId!);
                },
              );
            }).toList(),
          ),
        ),
      );
    }

    Widget _type2Row() {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Obx(() => Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: state.type2List.value.map((type) {
                return MistyTypeButton(
                  color: Constants.defaultColor,
                  borRadiusNum: 5,
                  text: isNullText(type.typeName),
                  isActive: type.typeId == state.type2SelectId.value,
                  onTap: () {
                    controller.onChangeType2SelectId(type.typeId!);
                  },
                );
              }).toList(),
            )),
      );
    }

    Widget _classRow() {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Obx(
          () => Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: state.classList.map((classStr) {
              return MistyTypeButton(
                color: Constants.defaultColor,
                borRadiusNum: 5,
                text: isNullText(classStr),
                isActive: classStr == state.classSelected.value,
                onTap: () {
                  controller.onChangeClass(classStr);
                },
              );
            }).toList(),
          ),
        ),
      );
    }

    Widget _areaRow() {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Obx(
          () => Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: state.areaList.map((area) {
              return MistyTypeButton(
                color: Constants.defaultColor,
                borRadiusNum: 5,
                text: isNullText(area),
                isActive: area == state.areaSelected.value,
                onTap: () {
                  controller.onChangeArea(area);
                },
              );
            }).toList(),
          ),
        ),
      );
    }

    Widget _yearRow() {
      return Obx(
        () => SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: state.yearList.map((year) {
              return MistyTypeButton(
                color: Constants.defaultColor,
                borRadiusNum: 5,
                text: isNullText(year),
                isActive: year == state.yearSelected.value,
                onTap: () {
                  controller.onChangeYear(year);
                },
              );
            }).toList(),
          ),
        ),
      );
    }

    Widget _languageRow() {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Obx(
          () => Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: state.languageList.map((language) {
              return MistyTypeButton(
                color: Constants.defaultColor,
                borRadiusNum: 5,
                text: isNullText(language),
                isActive: language == state.languageSelected.value,
                onTap: () {
                  controller.onChangeLanguage(language);
                },
              );
            }).toList(),
          ),
        ),
      );
    }

    Widget _filtrateContent() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _typeRow(),
            const SizedBox(
              height: 15,
            ),
            _type2Row(),
            const SizedBox(
              height: 15,
            ),
            _classRow(),
            const SizedBox(
              height: 15,
            ),
            _areaRow(),
            const SizedBox(
              height: 15,
            ),
            _yearRow(),
            const SizedBox(
              height: 15,
            ),
            _languageRow(),
          ],
        ),
      );
    }

    Widget _vodContent() {
      double gridWidth = (Constants.screenWidth / 3) - 15;
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
        child: GetBuilder<DiscoverController>(
          id: 'grid-list',
          builder: (controller) {
            return state.vodList.isNotEmpty
                ? GridView.builder(
                    shrinkWrap: true,
                    itemCount: state.vodList.length,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisSpacing: 0,
                            crossAxisSpacing: 3,
                            childAspectRatio: 1 / 2,
                            crossAxisCount: 3),
                    itemBuilder: (_, int index) {
                      Vod_entity vod = state.vodList[index];
                      return InkWell(
                        child: Column(
                          children: [
                            SizedBox(
                              width: gridWidth,
                              height: (2 * gridWidth) - 50,
                              child: Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(3.0)),
                                    child: ExtendedImage.network(
                                      isNullText(vod.vodPic),
                                      width: gridWidth,
                                      height: (2 * gridWidth) - 50,
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
                            SizedBox(
                              height: 50,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    isNullText(vod.vodName),
                                    textAlign: TextAlign.start,
                                    style: const TextStyle(
                                        fontSize: 15, color: Colors.black),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    isNullText(vod.vodContent),
                                    textAlign: TextAlign.start,
                                    style: const TextStyle(
                                        fontSize: 12, color: Colors.black87),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        onTap: () {
                          Get.toNamed(RouteConfig.play, arguments: vod.vodId);
                        },
                      );
                    })
                : const Text('暂无符合条件的数据');
          },
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0,
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
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          controller: controller.singleScrollController,
          scrollDirection: Axis.vertical,
          child: Column(
            children: [_filtrateContent(), _vodContent()],
          ),
        ),
      ),
    );
  }
}
