import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:nekoton_flutter_webview/nekoton_flutter_webview.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isAndroid) {
    await AndroidInAppWebViewController.setWebContentsDebuggingEnabled(true);
  }

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: const Text("Nekoton Webview")),
          body: SafeArea(
            child: Column(
              children: <Widget>[
                Expanded(
                  child: NekotonWebview(
                    onLoaded: (controller) {
                      controller.onDisconnected();
                      controller.onTransactionsFound();
                      controller.onContractStateChanged();
                      controller.onNetworkChanged();
                      controller.onPermissionsChanged();
                      controller.onLoggedOut();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
