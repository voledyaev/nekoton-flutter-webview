import 'dart:convert';

import 'package:flutter/foundation.dart';
import '../models/unsubscribe_input.dart';

Future<dynamic> unsubscribeHandler(List<dynamic> args) async {
  final jsonInput = jsonDecode(args.first as String) as Map<String, dynamic>;
  final input = UnsubscribeInput.fromJson(jsonInput);

  await Future.delayed(const Duration(seconds: 1));
  debugPrint(input.toString());
  debugPrint("unsubscribed");
}
