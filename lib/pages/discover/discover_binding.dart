import 'package:get/get.dart';

import 'discover_controller.dart';

class DiscoverBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DiscoverController());
  }
}
