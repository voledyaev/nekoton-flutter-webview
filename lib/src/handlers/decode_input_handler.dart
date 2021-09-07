import 'dart:convert';

import 'package:flutter/foundation.dart';
import '../models/decode_input_input.dart';
import '../models/decode_input_output.dart';

Future<dynamic> decodeInputHandler(List<dynamic> args) async {
  final jsonInput = jsonDecode(args.first as String) as Map<String, dynamic>;
  final input = DecodeInputInput.fromJson(jsonInput);

  await Future.delayed(const Duration(seconds: 1));
  debugPrint(input.toString());

  const output = DecodeInputOutput(
    method: "method",
    input: {
      "input": "input",
    },
  );
  final jsonOutput = jsonEncode(output.toJson());

  return jsonOutput;
}
