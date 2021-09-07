import 'package:freezed_annotation/freezed_annotation.dart';

import 'transaction.dart';
import 'transaction_id.dart';

part 'get_transactions_output.freezed.dart';
part 'get_transactions_output.g.dart';

@freezed
class GetTransactionsOutput with _$GetTransactionsOutput {
  @JsonSerializable(explicitToJson: true)
  const factory GetTransactionsOutput({
    required List<Transaction> transactions,
    TransactionId? continuation,
  }) = _GetTransactionsOutput;

  factory GetTransactionsOutput.fromJson(Map<String, dynamic> json) => _$GetTransactionsOutputFromJson(json);
}
