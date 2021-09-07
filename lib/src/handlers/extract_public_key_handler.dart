import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../models/extract_public_key_input.dart';
import '../models/extract_public_key_output.dart';

Future<dynamic> extractPublicKeyHandler(List<dynamic> args) async {
  final jsonInput = jsonDecode(args.first as String) as Map<String, dynamic>;
  final input = ExtractPublicKeyInput.fromJson(jsonInput);

  await Future.delayed(const Duration(seconds: 1));
  debugPrint(input.toString());

  const output = ExtractPublicKeyOutput(publicKey: "publicKey");
  final jsonOutput = jsonEncode(output.toJson());

  return jsonOutput;
}
