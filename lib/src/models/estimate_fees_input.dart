import 'package:freezed_annotation/freezed_annotation.dart';

import 'function_call.dart';

part 'estimate_fees_input.freezed.dart';
part 'estimate_fees_input.g.dart';

@freezed
class EstimateFeesInput with _$EstimateFeesInput {
  @JsonSerializable()
  const factory EstimateFeesInput({
    required String sender,
    required String recipient,
    required String amount,
    required FunctionCall? payload,
  }) = _EstimateFeesInput;

  factory EstimateFeesInput.fromJson(Map<String, dynamic> json) => _$EstimateFeesInputFromJson(json);
}
