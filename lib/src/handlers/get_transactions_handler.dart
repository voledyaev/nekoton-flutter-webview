import 'dart:convert';

import 'package:flutter/foundation.dart';
import '../models/account_status.dart';
import '../models/get_transactions_input.dart';
import '../models/get_transactions_output.dart';
import '../models/message.dart';
import '../models/transaction.dart';
import '../models/transaction_id.dart';

Future<dynamic> getTransactionsHandler(List<dynamic> args) async {
  final jsonInput = jsonDecode(args.first as String) as Map<String, dynamic>;
  final input = GetTransactionsInput.fromJson(jsonInput);

  await Future.delayed(const Duration(seconds: 1));
  debugPrint(input.toString());

  final output = GetTransactionsOutput(
    transactions: [
      Transaction(
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
        outMessages: const [
          Message(
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
    ],
    continuation: const TransactionId(
      lt: "lt",
      hash: "hash",
    ),
  );
  final jsonOutput = jsonEncode(output.toJson());

  return jsonOutput;
}
