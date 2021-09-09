import 'dart:convert';

import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import '../models/network_changed_event.dart';

Future<void> networkChangedCaller(InAppWebViewController inAppWebViewController) async {
  const output = NetworkChangedEvent(
    selectedConnection: "selectedConnection",
  );
  final jsonOutput = jsonEncode(output.toJson());

  inAppWebViewController.evaluateJavascript(source: 'networkChanged($jsonOutput)');
}
