import 'dart:convert';

import 'package:flutter/foundation.dart';
import '../models/subscribe_input.dart';
import '../models/subscribe_output.dart';

Future<dynamic> subscribeHandler(List<dynamic> args) async {
  final jsonInput = jsonDecode(args.first as String) as Map<String, dynamic>;
  final input = SubscribeInput.fromJson(jsonInput);

  await Future.delayed(const Duration(seconds: 1));
  debugPrint(input.toString());

  const output = SubscribeOutput(
    state: true,
    transactions: true,
  );
  final jsonOutput = jsonEncode(output.toJson());

  return jsonOutput;
}
