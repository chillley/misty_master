// import 'dart:io';

import 'package:dio/dio.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';

// import 'package:flutter/foundation.dart';
import 'package:misty_master/utils/toast_utils.dart';

// import 'package:path_provider/path_provider.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

/// @description  网络请求封装
/// @date 2021/10/25 10:48
/// @author xialei

// dio 拦截器
class HttpInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options
        .copyWith(headers: {"content-type": "application/json; charset=utf-8"});
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print(
        'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
    return super.onResponse(response, handler);
  }

  @override
  Future<void> onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.type == DioErrorType.other) {
      var connectivityResult = await (Connectivity().checkConnectivity());
      // 判断是否联网
      if (connectivityResult == ConnectivityResult.none) {
        ToastUtils.toast('当前网络不可用,请检查网络设置');
      }
    }

    if (err.response != null && err.response!.statusCode != 200) {
      ToastUtils.toast('网络错误');
    }

    return super.onError(err, handler);
  }
}

class HttpUtils {
  // 请求BaseUrl
  static const String baseUrl = 'http://10.10.10.32:7001';

  static late final Dio _dio;

  // 初始化 dio 方法
  static Future<void> init() async {
    // String tempPath = './cookie';

    // 获取临时路径  [获取临时路径报错,目前暂时禁用当前这段代码]
    // if (!kIsWeb) {
    //   Directory tempDir = await getTemporaryDirectory();
    //   tempPath = tempDir.path;
    // }
    // 添加cookie进入临时路径保存
    // var cookieJar = PersistCookieJar(storage: FileStorage(tempPath));
    _dio = Dio(BaseOptions(baseUrl: baseUrl, followRedirects: false));
    // dio 添加cookie管理 添加日志打印
    _dio
      // ..interceptors.add(CookieManager(cookieJar))
      ..interceptors.add(LogInterceptor(responseBody: true))
      // 添加拦截器
      ..interceptors.add(HttpInterceptor());
  }

  // 封装post方法
  static Future post(
    String path, {
    Map<String, dynamic> params = const {},
    data = const {},
    Options? options,
  }) async {
    Options requestOptions = options ?? Options();

    var response = await _dio.post(
      path,
      data: data,
      queryParameters: params,
      options: requestOptions,
    );
    return response.data;
  }

  // 封装get方法
  static Future get(
    String path, {
    Map<String, dynamic>? params = const {},
    Options? options,
  }) async {
    Options requestOptions = options ?? Options();

    var response = await _dio.get(
      path,
      queryParameters: params,
      options: requestOptions,
    );
    return response.data;
  }
}
