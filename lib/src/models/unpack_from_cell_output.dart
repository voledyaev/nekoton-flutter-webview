import 'package:freezed_annotation/freezed_annotation.dart';

part 'unpack_from_cell_output.freezed.dart';
part 'unpack_from_cell_output.g.dart';

@freezed
class UnpackFromCellOutput with _$UnpackFromCellOutput {
  @JsonSerializable()
  const factory UnpackFromCellOutput({
    required Map<String, dynamic> data,
  }) = _UnpackFromCellOutput;

  factory UnpackFromCellOutput.fromJson(Map<String, dynamic> json) => _$UnpackFromCellOutputFromJson(json);
}
