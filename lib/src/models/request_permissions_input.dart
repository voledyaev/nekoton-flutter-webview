import 'package:freezed_annotation/freezed_annotation.dart';

import 'permission.dart';

part 'request_permissions_input.freezed.dart';
part 'request_permissions_input.g.dart';

@freezed
class RequestPermissionsInput with _$RequestPermissionsInput {
  @JsonSerializable()
  const factory RequestPermissionsInput({
    required List<Permission> permissions,
  }) = _RequestPermissionsInput;

  factory RequestPermissionsInput.fromJson(Map<String, dynamic> json) => _$RequestPermissionsInputFromJson(json);
}
