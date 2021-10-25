import 'package:misty_master/service/api.dart';
import 'package:misty_master/utils/http_utils.dart';

class Service {
  /// 登录接口
  static login(data) {
    return HttpUtils.post(Api.login, data: data);
  }
}
