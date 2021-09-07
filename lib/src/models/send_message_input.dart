import 'package:freezed_annotation/freezed_annotation.dart';

import 'function_call.dart';

part 'send_message_input.freezed.dart';
part 'send_message_input.g.dart';

@freezed
class SendMessageInput with _$SendMessageInput {
  @JsonSerializable()
  const factory SendMessageInput({
    required String sender,
    required String recipient,
    required String amount,
    required bool bounce,
    required FunctionCall? payload,
  }) = _SendMessageInput;

  factory SendMessageInput.fromJson(Map<String, dynamic> json) => _$SendMessageInputFromJson(json);
}
