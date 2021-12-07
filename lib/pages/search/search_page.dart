import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:misty_master/components/misty_list_view_item.dart';
import 'package:misty_master/constants/constants.dart';

import 'search_controller.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SearchController>();
    final state = Get.find<SearchController>().state;

    Widget _listItem() {
      return GetBuilder<SearchController>(
          id: 'search-list',
          builder: (controller) {
            return Container(
              color: Colors.white,
              child: MistyListViewItem(
                scrollController: controller.scrollController,
                vodList: state.vodList,
              ),
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
                  height: 38,
                  child: TextField(
                    controller: controller.textEditingController,
                    textInputAction: TextInputAction.search,
                    keyboardType: TextInputType.text,
                    maxLines: 1,
                    cursorColor: Constants.defaultColor,
                    autofocus: true,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.only(bottom: 10),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 5, right: 10),
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
