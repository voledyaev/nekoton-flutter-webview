import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../models/run_local_input.dart';
import '../models/run_local_output.dart';

Future<dynamic> runLocalHandler(List<dynamic> args) async {
  final jsonInput = jsonDecode(args.first as String) as Map<String, dynamic>;
  final input = RunLocalInput.fromJson(jsonInput);

  await Future.delayed(const Duration(seconds: 1));
  debugPrint(input.toString());

  const output = RunLocalOutput(output: {"output": "output"}, code: 0);
  final jsonOutput = jsonEncode(output.toJson());

  return jsonOutput;
}
