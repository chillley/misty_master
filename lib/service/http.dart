import 'package:misty_master/service/api.dart';
import 'package:misty_master/utils/http_utils.dart';

class Http {
  static getVodList(data) {
    return HttpUtils.post(Api.getVodList, data: data);
  }

  static getLevel1TypeList() {
    return HttpUtils.post(Api.getLevel1TypeList);
  }

  static getVodListByType(data) {
    return HttpUtils.post(Api.getVodListByType, data: data);
  }

  static getVodDetails(data) {
    return HttpUtils.post(Api.getVodDetails, data: data);
  }

  static getVodPlayVideoSourceFormat(data) {
    return HttpUtils.post(Api.getVodPlayVideoSourceFormat, data: data);
  }

  static getFqVideosPlayerListByFq(data) {
    return HttpUtils.post(Api.getFqVideosPlayerListByFq, data: data);
  }

}
