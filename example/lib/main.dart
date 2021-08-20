import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isAndroid) {
    await AndroidInAppWebViewController.setWebContentsDebuggingEnabled(true);
  }

  runApp(new MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
    android: AndroidInAppWebViewOptions(
      useHybridComposition: true,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("JavaScript Handlers")),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Expanded(
                child: InAppWebView(
                  initialUrlRequest: URLRequest(url: Uri.parse("https://google.com/")),
                  initialOptions: options,
                  onWebViewCreated: (controller) {
                    controller.addJavaScriptHandler(
                      handlerName: 'requestPermissions',
                      callback: (args) async {
                        print('FLUTTER requestPermissions ${args.first}');

                        await Future.delayed(Duration(seconds: 1));

                        return args;
                      },
                    );

                    controller.addJavaScriptHandler(
                      handlerName: 'disconnect',
                      callback: (args) async {
                        print('FLUTTER disconnect ${args.first}');

                        await Future.delayed(Duration(seconds: 1));

                        return args;
                      },
                    );

                    controller.addJavaScriptHandler(
                      handlerName: 'subscribe',
                      callback: (args) async {
                        print('FLUTTER subscribe ${args.first}');

                        await Future.delayed(Duration(seconds: 1));

                        return args;
                      },
                    );

                    controller.addJavaScriptHandler(
                      handlerName: 'unsubscribe',
                      callback: (args) async {
                        print('FLUTTER unsubscribe ${args.first}');

                        await Future.delayed(Duration(seconds: 1));

                        return args;
                      },
                    );

                    controller.addJavaScriptHandler(
                      handlerName: 'unsubscribeAll',
                      callback: (args) async {
                        print('FLUTTER unsubscribeAll ${args.first}');

                        await Future.delayed(Duration(seconds: 1));

                        return args;
                      },
                    );

                    controller.addJavaScriptHandler(
                      handlerName: 'getProviderState',
                      callback: (args) async {
                        print('FLUTTER getProviderState ${args.first}');

                        await Future.delayed(Duration(seconds: 1));

                        return args;
                      },
                    );

                    controller.addJavaScriptHandler(
                      handlerName: 'getFullContractState',
                      callback: (args) async {
                        print('FLUTTER getFullContractState ${args.first}');

                        await Future.delayed(Duration(seconds: 1));

                        return args;
                      },
                    );

                    controller.addJavaScriptHandler(
                      handlerName: 'getTransactions',
                      callback: (args) async {
                        print('FLUTTER getTransactions ${args.first}');

                        await Future.delayed(Duration(seconds: 1));

                        return args;
                      },
                    );

                    controller.addJavaScriptHandler(
                      handlerName: 'runLocal',
                      callback: (args) async {
                        print('FLUTTER runLocal ${args.first}');

                        await Future.delayed(Duration(seconds: 1));

                        return args;
                      },
                    );

                    controller.addJavaScriptHandler(
                      handlerName: 'getExpectedAddress',
                      callback: (args) async {
                        print('FLUTTER getExpectedAddress ${args.first}');

                        await Future.delayed(Duration(seconds: 1));

                        return args;
                      },
                    );

                    controller.addJavaScriptHandler(
                      handlerName: 'packIntoCell',
                      callback: (args) async {
                        print('FLUTTER packIntoCell ${args.first}');

                        await Future.delayed(Duration(seconds: 1));

                        return args;
                      },
                    );

                    controller.addJavaScriptHandler(
                      handlerName: 'unpackFromCell',
                      callback: (args) async {
                        print('FLUTTER unpackFromCell ${args.first}');

                        await Future.delayed(Duration(seconds: 1));

                        return args;
                      },
                    );

                    controller.addJavaScriptHandler(
                      handlerName: 'extractPublicKey',
                      callback: (args) async {
                        print('FLUTTER extractPublicKey ${args.first}');

                        await Future.delayed(Duration(seconds: 1));

                        return args;
                      },
                    );

                    controller.addJavaScriptHandler(
                      handlerName: 'codeToTvc',
                      callback: (args) async {
                        print('FLUTTER codeToTvc ${args.first}');

                        await Future.delayed(Duration(seconds: 1));

                        return args;
                      },
                    );

                    controller.addJavaScriptHandler(
                      handlerName: 'splitTvc',
                      callback: (args) async {
                        print('FLUTTER splitTvc ${args.first}');

                        await Future.delayed(Duration(seconds: 1));

                        return args;
                      },
                    );

                    controller.addJavaScriptHandler(
                      handlerName: 'encodeInternalInput',
                      callback: (args) async {
                        print('FLUTTER encodeInternalInput ${args.first}');

                        await Future.delayed(Duration(seconds: 1));

                        return args;
                      },
                    );

                    controller.addJavaScriptHandler(
                      handlerName: 'decodeInput',
                      callback: (args) async {
                        print('FLUTTER decodeInput ${args.first}');

                        await Future.delayed(Duration(seconds: 1));

                        return args;
                      },
                    );

                    controller.addJavaScriptHandler(
                      handlerName: 'decodeEvent',
                      callback: (args) async {
                        print('FLUTTER decodeEvent ${args.first}');

                        await Future.delayed(Duration(seconds: 1));

                        return args;
                      },
                    );

                    controller.addJavaScriptHandler(
                      handlerName: 'decodeOutput',
                      callback: (args) async {
                        print('FLUTTER decodeOutput ${args.first}');

                        await Future.delayed(Duration(seconds: 1));

                        return args;
                      },
                    );

                    controller.addJavaScriptHandler(
                      handlerName: 'decodeTransaction',
                      callback: (args) async {
                        print('FLUTTER decodeTransaction ${args.first}');

                        await Future.delayed(Duration(seconds: 1));

                        return args;
                      },
                    );

                    controller.addJavaScriptHandler(
                      handlerName: 'decodeTransactionEvents',
                      callback: (args) async {
                        print('FLUTTER decodeTransactionEvents ${args.first}');

                        await Future.delayed(Duration(seconds: 1));

                        return args;
                      },
                    );

                    controller.addJavaScriptHandler(
                      handlerName: 'estimateFees',
                      callback: (args) async {
                        print('FLUTTER estimateFees ${args.first}');

                        await Future.delayed(Duration(seconds: 1));

                        return args;
                      },
                    );

                    controller.addJavaScriptHandler(
                      handlerName: 'sendMessage',
                      callback: (args) async {
                        print('FLUTTER sendMessage ${args.first}');

                        await Future.delayed(Duration(seconds: 1));

                        return args;
                      },
                    );

                    controller.addJavaScriptHandler(
                      handlerName: 'sendExternalMessage',
                      callback: (args) async {
                        print('FLUTTER sendExternalMessage ${args.first}');

                        await Future.delayed(Duration(seconds: 1));

                        return args;
                      },
                    );
                  },
                  onLoadStop: (controller, url) async {
                    final main = await rootBundle.loadString('assets/js/main.js');
                    await controller.evaluateJavascript(source: main);

                    final call = await rootBundle.loadString('assets/js/call.js');
                    await controller.evaluateJavascript(source: call);
                  },
                  onConsoleMessage: (controller, consoleMessage) {
                    print(consoleMessage.message);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
