import 'dart:convert';

import 'package:flutter/foundation.dart';
import '../models/unpack_from_cell_input.dart';
import '../models/unpack_from_cell_output.dart';

Future<dynamic> unpackFromCellHandler(List<dynamic> args) async {
  final jsonInput = jsonDecode(args.first as String) as Map<String, dynamic>;
  final input = UnpackFromCellInput.fromJson(jsonInput);

  await Future.delayed(const Duration(seconds: 1));
  debugPrint(input.toString());

  const output = UnpackFromCellOutput(data: {"data": "data"});
  final jsonOutput = jsonEncode(output.toJson());

  return jsonOutput;
}
