import 'dart:convert';

import 'package:flutter/foundation.dart';
import '../models/decode_transaction_input.dart';
import '../models/decode_transaction_output.dart';

Future<dynamic> decodeTransactionHandler(List<dynamic> args) async {
  final jsonInput = jsonDecode(args.first as String) as Map<String, dynamic>;
  final input = DecodeTransactionInput.fromJson(jsonInput);

  await Future.delayed(const Duration(seconds: 1));
  debugPrint(input.toString());

  const output = DecodeTransactionOutput(
    method: "method",
    input: {
      "input": "input",
    },
    output: {
      "output": "output",
    },
  );
  final jsonOutput = jsonEncode(output.toJson());

  return jsonOutput;
}
