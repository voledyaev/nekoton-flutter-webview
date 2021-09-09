import 'dart:convert';

import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import '../models/account_interaction.dart';
import '../models/permissions.dart';
import '../models/permissions_changed_event.dart';
import '../models/wallet_contract_type.dart';

Future<void> permissionsChangedCaller(InAppWebViewController inAppWebViewController) async {
  final output = PermissionsChangedEvent(
    permissions: Permissions(
      tonClient: true,
      accountInteraction: AccountInteraction(
        address: "address",
        publicKey: "publicKey",
        contractType: WalletContractType.values.first,
      ),
    ),
  );
  final jsonOutput = jsonEncode(output.toJson());

  inAppWebViewController.evaluateJavascript(source: 'permissionsChanged($jsonOutput)');
}
