import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:misty_master/constants/constants.dart';

import 'search_controller.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SearchController>();
    final state = Get.find<SearchController>().state;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Container(
          padding: const EdgeInsets.all(5),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(2)),
                      border: Border.all(color: Colors.black12, width: 1.0),
                      color: Colors.white),
                  height: 40,
                  child: TextField(
                    controller: controller.textEditingController,
                    textInputAction: TextInputAction.search,
                    keyboardType: TextInputType.text,
                    maxLines: 1,
                    cursorColor: Constants.defaultColor,
                    decoration: const InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 4, horizontal: 1.0),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 10, top: 5),
                        child: Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                      ),
                      prefixIconConstraints:
                          BoxConstraints(maxWidth: 30, minHeight: 25),
                      border: InputBorder.none,
                      hintText: '请输入关键字',
                      hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    style: const TextStyle(fontSize: 15, color: Colors.black),
                    onChanged: (value) {
                      print('输入的值$value');
                    },
                    onEditingComplete: () {
                      print('输入完成');
                      print(controller.textEditingController.text);
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
