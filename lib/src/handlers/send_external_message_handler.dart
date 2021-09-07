import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../models/account_status.dart';
import '../models/message.dart';
import '../models/send_external_message_input.dart';
import '../models/send_external_message_output.dart';
import '../models/transaction.dart';
import '../models/transaction_id.dart';

Future<dynamic> sendExternalMessageHandler(List<dynamic> args) async {
  final jsonInput = jsonDecode(args.first as String) as Map<String, dynamic>;
  final input = SendExternalMessageInput.fromJson(jsonInput);

  await Future.delayed(const Duration(seconds: 1));
  debugPrint(input.toString());

  final output = SendExternalMessageOutput(
    transaction: Transaction(
      id: const TransactionId(
        lt: "lt",
        hash: "hash",
      ),
      prevTransactionId: const TransactionId(
        lt: "lt",
        hash: "hash",
      ),
      createdAt: 1,
      aborted: true,
      origStatus: AccountStatus.values.first,
      endStatus: AccountStatus.values.first,
      totalFees: "totalFees",
      inMessage: const Message(
        src: "src",
        dst: "dst",
        value: "value",
        bounce: true,
        bounced: true,
        body: "body",
        bodyHash: "bodyHash",
      ),
      outMessages: [
        const Message(
          src: "src",
          dst: "dst",
          value: "value",
          bounce: true,
          bounced: true,
          body: "body",
          bodyHash: "bodyHash",
        ),
      ],
    ),
    output: {
      "output": "output",
    },
  );
  final jsonOutput = jsonEncode(output.toJson());

  return jsonOutput;
}
