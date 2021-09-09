import 'dart:convert';

import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import '../models/contract_state.dart';
import '../models/contract_state_changed_event.dart';
import '../models/gen_timings.dart';
import '../models/last_transaction_id.dart';

Future<void> contractStateChangedCaller(InAppWebViewController inAppWebViewController) async {
  const output = ContractStateChangedEvent(
    address: "address",
    state: ContractState(
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
    ),
  );
  final jsonOutput = jsonEncode(output.toJson());

  inAppWebViewController.evaluateJavascript(source: 'contractStateChanged($jsonOutput)');
}
