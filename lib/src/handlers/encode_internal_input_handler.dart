import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../models/encode_internal_input_input.dart';
import '../models/encode_internal_input_output.dart';

Future<dynamic> encodeInternalInputHandler(List<dynamic> args) async {
  final jsonInput = jsonDecode(args.first as String) as Map<String, dynamic>;
  final input = EncodeInternalInputInput.fromJson(jsonInput);

  await Future.delayed(const Duration(seconds: 1));
  debugPrint(input.toString());

  const output = EncodeInternalInputOutput(boc: "boc");
  final jsonOutput = jsonEncode(output.toJson());

  return jsonOutput;
}
