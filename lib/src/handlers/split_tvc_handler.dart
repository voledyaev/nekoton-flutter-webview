import 'dart:convert';

import 'package:flutter/foundation.dart';
import '../models/split_tvc_input.dart';
import '../models/split_tvc_output.dart';

Future<dynamic> splitTvcHandler(List<dynamic> args) async {
  final jsonInput = jsonDecode(args.first as String) as Map<String, dynamic>;
  final input = SplitTvcInput.fromJson(jsonInput);

  await Future.delayed(const Duration(seconds: 1));
  debugPrint(input.toString());

  const output = SplitTvcOutput(
    data: "data",
    code: "code",
  );
  final jsonOutput = jsonEncode(output.toJson());

  return jsonOutput;
}
