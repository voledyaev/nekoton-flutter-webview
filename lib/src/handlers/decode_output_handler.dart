import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../models/decode_output_input.dart';
import '../models/decode_output_output.dart';

Future<dynamic> decodeOutputHandler(List<dynamic> args) async {
  final jsonInput = jsonDecode(args.first as String) as Map<String, dynamic>;
  final input = DecodeOutputInput.fromJson(jsonInput);

  await Future.delayed(const Duration(seconds: 1));
  debugPrint(input.toString());

  const output = DecodeOutputOutput(
    method: "method",
    output: {
      "output": "output",
    },
  );
  final jsonOutput = jsonEncode(output.toJson());

  return jsonOutput;
}
