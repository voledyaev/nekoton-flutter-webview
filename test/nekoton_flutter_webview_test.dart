import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nekoton_flutter_webview/nekoton_flutter_webview.dart';

void main() {
  const MethodChannel channel = MethodChannel('nekoton_flutter_webview');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await NekotonFlutterWebview.platformVersion, '42');
  });
}
