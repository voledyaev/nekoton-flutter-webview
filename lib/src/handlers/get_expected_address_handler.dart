import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../models/get_expected_address_input.dart';
import '../models/get_expected_address_output.dart';

Future<dynamic> getExpectedAddressHandler(List<dynamic> args) async {
  final jsonInput = jsonDecode(args.first as String) as Map<String, dynamic>;
  final input = GetExpectedAddressInput.fromJson(jsonInput);

  await Future.delayed(const Duration(seconds: 1));
  debugPrint(input.toString());

  const output = GetExpectedAddressOutput(address: "address");
  final jsonOutput = jsonEncode(output.toJson());

  return jsonOutput;
}
