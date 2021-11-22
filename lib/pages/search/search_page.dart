import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'search_controller.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SearchController>();
    final state = Get.find<SearchController>().state;

    return Scaffold(
      appBar: AppBar(
        title: Container(
          padding: const EdgeInsets.all(5),
          child: Row(
            children: const [Expanded(child: TextField()), Text('搜索')],
          ),
        ),
      ),
    );
  }
}
