import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:misty_master/components/misty_gradient_button.dart';
import 'package:misty_master/constants/constants.dart';
import 'package:misty_master/routes/route_config.dart';

import 'mine_controller.dart';

class MinePage extends StatelessWidget {
  const MinePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MineController>();
    final state = Get.find<MineController>().state;

    _topContent() {
      return Container(
        color: Colors.white,
        height: 140,
        alignment: Alignment.center,
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(50.0)),
          child: Image.asset(
            "assets/images/header.png",
            height: 100,
            width: 100,
            fit: BoxFit.cover,
          ),
        ),
      );
    }

    Widget _buildItem(BuildContext context, IconData icon, String title,
            {VoidCallback? onTap}) =>
        ListTile(
          leading: Icon(
            icon,
            color: Constants.defaultColor,
          ),
          title: Text(title),
          trailing:
              const Icon(Icons.chevron_right, color: Constants.defaultColor),
          onTap: () {
            return "暂未实现".toast();
          },
        );

    _listContent() {
      return Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 10,
            ),
            _buildItem(context, Icons.settings, '应用设置'),
            _buildItem(context, Icons.construction, '数据管理'),
            _buildItem(context, Icons.history, '历史记录'),
            _buildItem(context, Icons.collections, '我的收藏'),
            const Divider(
              height: 1,
            ),
            _buildItem(context, Icons.update, '版本信息'),
            _buildItem(context, Icons.info, '关于应用'),
            const Divider(
              height: 1,
            ),
          ],
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
        title: const Text('我的'),
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
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            _topContent(),
            _listContent(),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 0),
              height: 48,
              child: SizedBox(
                width: double.infinity,
                height: 48,
                child: GradientButton(
                  onPressed: () {
                    SystemNavigator.pop();
                  },
                  child: const Text('退出'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
