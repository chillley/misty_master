import 'package:oktoast/oktoast.dart';

class ToastUtils {
  static void toast(String message, {int duration = 2000}) {
    showToast(
      message,
      duration: Duration(milliseconds: duration),
      dismissOtherToast: true,
    );
  }

  static void closeToast() {
    dismissAllToast();
  }
}
