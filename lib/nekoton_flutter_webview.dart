
import 'dart:async';

import 'package:flutter/services.dart';

class NekotonFlutterWebview {
  static const MethodChannel _channel =
      const MethodChannel('nekoton_flutter_webview');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
