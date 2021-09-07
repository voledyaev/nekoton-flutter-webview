import 'package:freezed_annotation/freezed_annotation.dart';

part 'split_tvc_output.freezed.dart';
part 'split_tvc_output.g.dart';

@freezed
class SplitTvcOutput with _$SplitTvcOutput {
  @JsonSerializable()
  const factory SplitTvcOutput({
    String? data,
    String? code,
  }) = _SplitTvcOutput;

  factory SplitTvcOutput.fromJson(Map<String, dynamic> json) => _$SplitTvcOutputFromJson(json);
}
