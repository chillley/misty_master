import 'package:misty_master/service/api.dart';
import 'package:misty_master/utils/http_utils.dart';

class Http {
  /// 登录接口
  static getVodList(data) {
    return HttpUtils.post(Api.getVodList, data: data);
  }
}
