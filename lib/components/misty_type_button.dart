import 'package:flutter/material.dart';

class MistyTypeButton extends StatelessWidget {
  final String text;
  final Color color;
  final bool isActive;
  final double borRadiusNum;
  final Function? onTap;

  const MistyTypeButton({
    Key? key,
    required this.text,
    required this.color,
    required this.isActive,
    required this.borRadiusNum,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
          color: isActive ? color : Colors.transparent,
          borderRadius: BorderRadius.all(Radius.circular(borRadiusNum)),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 4),
          child: Text(
            text,
            style: TextStyle(color: isActive ? Colors.white : Colors.black),
          ),
        ),
      ),
      onTap: () {
        if (onTap != null) {
          onTap!();
        }
      },
    );
  }
}
