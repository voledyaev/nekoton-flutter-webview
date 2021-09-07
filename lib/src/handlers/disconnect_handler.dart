import 'package:flutter/foundation.dart';

Future<dynamic> disconnectHandler(List<dynamic> args) async {
  await Future.delayed(const Duration(seconds: 1));
  debugPrint("disconnected");
}
