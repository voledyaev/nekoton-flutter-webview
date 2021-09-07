import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../models/decode_transaction_events_input.dart';
import '../models/decode_transaction_events_output.dart';

Future<dynamic> decodeTransactionEventsHandler(List<dynamic> args) async {
  final jsonInput = jsonDecode(args.first as String) as Map<String, dynamic>;
  final input = DecodeTransactionEventsInput.fromJson(jsonInput);

  await Future.delayed(const Duration(seconds: 1));
  debugPrint(input.toString());

  const output = DecodeTransactionEventsOutput(events: []);
  final jsonOutput = jsonEncode(output.toJson());

  return jsonOutput;
}
