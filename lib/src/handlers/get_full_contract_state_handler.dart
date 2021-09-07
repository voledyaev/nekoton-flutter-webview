import 'dart:convert';

import 'package:flutter/foundation.dart';
import '../models/full_contract_state.dart';
import '../models/gen_timings.dart';
import '../models/get_full_contract_state_input.dart';
import '../models/get_full_contract_state_output.dart';
import '../models/last_transaction_id.dart';

Future<dynamic> getFullContractStateHandler(List<dynamic> args) async {
  final jsonInput = jsonDecode(args.first as String) as Map<String, dynamic>;
  final input = GetFullContractStateInput.fromJson(jsonInput);

  await Future.delayed(const Duration(seconds: 1));
  debugPrint(input.toString());

  const output = GetFullContractStateOutput(
    state: FullContractState(
      balance: "balance",
      genTimings: GenTimings(
        genLt: "genLt",
        genUtime: 0,
      ),
      lastTransactionId: LastTransactionId(
        isExact: true,
        lt: "lt",
        hash: "hash",
      ),
      isDeployed: true,
      boc: "boc",
    ),
  );
  final jsonOutput = jsonEncode(output.toJson());

  return jsonOutput;
}
