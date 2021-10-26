import 'package:misty_master/constants/constants.dart';
import 'package:oktoast/oktoast.dart';
import 'package:flutter/material.dart';

/// @description  Extended String and other types
/// @date 2021/10/26 10:17
/// @author xialei

/// 扩展String类型封装自定义Toast
extension NullableStringExt on String? {
  toast() async {
    showToastWidget(Builder(
      builder: (BuildContext context) {
        const bgc = Constants.defaultColor;
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 12.0,
              ),
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    bgc,
                    bgc.withOpacity(0.87),
                  ],
                ),
                borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.024),
                    offset: const Offset(0, 1),
                    blurRadius: 3.0,
                    spreadRadius: 3.0,
                  ),
                ],
              ),
              child: Text(
                this!,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        );
      },
    ));
  }
}
