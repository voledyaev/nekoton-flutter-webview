import 'dart:convert';

import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import '../models/account_status.dart';
import '../models/message.dart';
import '../models/transaction.dart';
import '../models/transaction_id.dart';
import '../models/transactions_batch_info.dart';
import '../models/transactions_batch_type.dart';
import '../models/transactions_found_event.dart';

Future<void> transactionsFoundCaller(InAppWebViewController inAppWebViewController) async {
  final output = TransactionsFoundEvent(
    address: "address",
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
    ],
    info: const TransactionsBatchInfo(
      minLt: "minLt",
      maxLt: "maxLt",
      batchType: TransactionsBatchType.newTransactions,
    ),
  );
  final jsonOutput = jsonEncode(output.toJson());

  inAppWebViewController.evaluateJavascript(source: 'transactionsFound($jsonOutput)');
}
