import 'dart:convert';

import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import '../models/error.dart';

Future<void> disconnectedCaller(InAppWebViewController inAppWebViewController) async {
  final output = Error(
    name: "name",
    message: "message",
    stack: StackTrace.current.toString(),
  );
  final jsonOutput = jsonEncode(output.toJson());

  inAppWebViewController.evaluateJavascript(source: 'disconnected($jsonOutput)');
}
