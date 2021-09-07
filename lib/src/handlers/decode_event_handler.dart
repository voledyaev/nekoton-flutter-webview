import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../models/decode_event_input.dart';
import '../models/decode_event_output.dart';

Future<dynamic> decodeEventHandler(List<dynamic> args) async {
  final jsonInput = jsonDecode(args.first as String) as Map<String, dynamic>;
  final input = DecodeEventInput.fromJson(jsonInput);

  await Future.delayed(const Duration(seconds: 1));
  debugPrint(input.toString());

  const output = DecodeEventOutput(
    event: "event",
    data: {
      "data": "data",
    },
  );
  final jsonOutput = jsonEncode(output.toJson());

  return jsonOutput;
}
