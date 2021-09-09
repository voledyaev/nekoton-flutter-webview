import 'package:flutter_inappwebview/flutter_inappwebview.dart';

Future<void> loggedOutCaller(InAppWebViewController inAppWebViewController) async {
  inAppWebViewController.evaluateJavascript(source: 'loggedOut()');
}
