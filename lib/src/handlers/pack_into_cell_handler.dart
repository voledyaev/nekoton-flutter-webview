import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../models/pack_into_cell_input.dart';
import '../models/pack_into_cell_output.dart';

Future<dynamic> packIntoCellHandler(List<dynamic> args) async {
  final jsonInput = jsonDecode(args.first as String) as Map<String, dynamic>;
  final input = PackIntoCellInput.fromJson(jsonInput);

  await Future.delayed(const Duration(seconds: 1));
  debugPrint(input.toString());

  const output = PackIntoCellOutput(boc: "boc");
  final jsonOutput = jsonEncode(output.toJson());

  return jsonOutput;
}
