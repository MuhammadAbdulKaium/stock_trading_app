import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';

void setStatusBarColor(Color color) {
  FlutterStatusbarcolor.setStatusBarColor(color);
  FlutterStatusbarcolor.setStatusBarWhiteForeground(
    useWhiteForeground(color)
  );
}