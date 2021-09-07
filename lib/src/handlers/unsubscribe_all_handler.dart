import 'package:flutter/foundation.dart';

Future<dynamic> unsubscribeAllHandler(List<dynamic> args) async {
  await Future.delayed(const Duration(seconds: 1));
  debugPrint("unsubscribed all");
}
