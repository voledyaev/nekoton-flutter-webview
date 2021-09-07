import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../models/code_to_tvc_input.dart';
import '../models/code_to_tvc_output.dart';

Future<dynamic> codeToTvcHandler(List<dynamic> args) async {
  final jsonInput = jsonDecode(args.first as String) as Map<String, dynamic>;
  final input = CodeToTvcInput.fromJson(jsonInput);

  await Future.delayed(const Duration(seconds: 1));
  debugPrint(input.toString());

  const output = CodeToTvcOutput(tvc: "tvc");
  final jsonOutput = jsonEncode(output.toJson());

  return jsonOutput;
}
