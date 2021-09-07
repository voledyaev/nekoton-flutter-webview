import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../models/estimate_fees_input.dart';
import '../models/estimate_fees_output.dart';

Future<dynamic> estimateFeesHandler(List<dynamic> args) async {
  final jsonInput = jsonDecode(args.first as String) as Map<String, dynamic>;
  final input = EstimateFeesInput.fromJson(jsonInput);

  await Future.delayed(const Duration(seconds: 1));
  debugPrint(input.toString());

  const output = EstimateFeesOutput(fees: "fees");
  final jsonOutput = jsonEncode(output.toJson());

  return jsonOutput;
}
