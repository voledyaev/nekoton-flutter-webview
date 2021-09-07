import 'dart:convert';

import 'package:flutter/foundation.dart';
import '../models/account_interaction.dart';
import '../models/request_permissions_input.dart';
import '../models/request_permissions_output.dart';
import '../models/wallet_contract_type.dart';

Future<dynamic> requestPermissionsHandler(List<dynamic> args) async {
  final jsonInput = jsonDecode(args.first as String) as Map<String, dynamic>;
  final input = RequestPermissionsInput.fromJson(jsonInput);

  await Future.delayed(const Duration(seconds: 1));
  debugPrint(input.toString());

  final output = RequestPermissionsOutput(
    tonClient: true,
    accountInteraction: AccountInteraction(
      address: "address",
      publicKey: "publicKey",
      contractType: WalletContractType.values.first,
    ),
  );
  final jsonOutput = jsonEncode(output.toJson());

  return jsonOutput;
}
