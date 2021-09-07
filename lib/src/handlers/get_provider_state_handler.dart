import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../models/account_interaction.dart';
import '../models/contract_updates_subscription.dart';
import '../models/get_provider_state_output.dart';
import '../models/permissions.dart';
import '../models/wallet_contract_type.dart';

Future<dynamic> getProviderStateHandler(List<dynamic> args) async {
  await Future.delayed(const Duration(seconds: 1));
  debugPrint("get provider state");

  final output = GetProviderStateOutput(
    version: "version",
    numericVersion: 0,
    selectedConnection: "selectedConnection",
    permissions: Permissions(
      tonClient: true,
      accountInteraction: AccountInteraction(
        address: "address",
        publicKey: "publicKey",
        contractType: WalletContractType.values.first,
      ),
    ),
    subscriptions: {
      "address": const ContractUpdatesSubscription(
        state: true,
        transactions: true,
      ),
    },
  );
  final jsonOutput = jsonEncode(output.toJson());

  return jsonOutput;
}
