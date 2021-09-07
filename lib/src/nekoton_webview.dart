import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import 'handlers/code_to_tvc_handler.dart';
import 'handlers/decode_event_handler.dart';
import 'handlers/decode_input_handler.dart';
import 'handlers/decode_output_handler.dart';
import 'handlers/decode_transaction_events_handler.dart';
import 'handlers/decode_transaction_handler.dart';
import 'handlers/disconnect_handler.dart';
import 'handlers/encode_internal_input_handler.dart';
import 'handlers/estimate_fees_handler.dart';
import 'handlers/extract_public_key_handler.dart';
import 'handlers/get_expected_address_handler.dart';
import 'handlers/get_full_contract_state_handler.dart';
import 'handlers/get_provider_state_handler.dart';
import 'handlers/get_transactions_handler.dart';
import 'handlers/pack_into_cell_handler.dart';
import 'handlers/request_permissions_handler.dart';
import 'handlers/run_local_handler.dart';
import 'handlers/send_external_message_handler.dart';
import 'handlers/send_message_handler.dart';
import 'handlers/split_tvc_handler.dart';
import 'handlers/subscribe_handler.dart';
import 'handlers/unpack_from_cell_handler.dart';
import 'handlers/unsubscribe_all_handler.dart';
import 'handlers/unsubscribe_handler.dart';

class NekotonWebview extends StatefulWidget {
  @override
  _NekotonWebviewState createState() => _NekotonWebviewState();
}

class _NekotonWebviewState extends State<NekotonWebview> {
  final options = InAppWebViewGroupOptions(
    android: AndroidInAppWebViewOptions(
      useHybridComposition: true,
    ),
  );

  @override
  Widget build(BuildContext context) => FutureBuilder<List<String>>(
        future: rootBundle.loadString('assets/js/main.js').then((value) async {
          final value2 = await rootBundle.loadString('assets/js/call.js');
          return [value, value2];
        }),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return InAppWebView(
              initialUrlRequest: URLRequest(url: Uri.parse("https://google.com/")),
              initialUserScripts: UnmodifiableListView<UserScript>([
                UserScript(
                  source: snapshot.data!.first,
                  injectionTime: UserScriptInjectionTime.AT_DOCUMENT_START,
                ),
              ]),
              initialOptions: options,
              onWebViewCreated: (controller) {
                controller.addJavaScriptHandler(
                  handlerName: 'requestPermissions',
                  callback: requestPermissionsHandler,
                );

                controller.addJavaScriptHandler(
                  handlerName: 'disconnect',
                  callback: disconnectHandler,
                );

                controller.addJavaScriptHandler(
                  handlerName: 'subscribe',
                  callback: subscribeHandler,
                );

                controller.addJavaScriptHandler(
                  handlerName: 'unsubscribe',
                  callback: unsubscribeHandler,
                );

                controller.addJavaScriptHandler(
                  handlerName: 'unsubscribeAll',
                  callback: unsubscribeAllHandler,
                );

                controller.addJavaScriptHandler(
                  handlerName: 'getProviderState',
                  callback: getProviderStateHandler,
                );

                controller.addJavaScriptHandler(
                  handlerName: 'getFullContractState',
                  callback: getFullContractStateHandler,
                );

                controller.addJavaScriptHandler(
                  handlerName: 'getTransactions',
                  callback: getTransactionsHandler,
                );

                controller.addJavaScriptHandler(
                  handlerName: 'runLocal',
                  callback: runLocalHandler,
                );

                controller.addJavaScriptHandler(
                  handlerName: 'getExpectedAddress',
                  callback: getExpectedAddressHandler,
                );

                controller.addJavaScriptHandler(
                  handlerName: 'packIntoCell',
                  callback: packIntoCellHandler,
                );

                controller.addJavaScriptHandler(
                  handlerName: 'unpackFromCell',
                  callback: unpackFromCellHandler,
                );

                controller.addJavaScriptHandler(
                  handlerName: 'extractPublicKey',
                  callback: extractPublicKeyHandler,
                );

                controller.addJavaScriptHandler(
                  handlerName: 'codeToTvc',
                  callback: codeToTvcHandler,
                );

                controller.addJavaScriptHandler(
                  handlerName: 'splitTvc',
                  callback: splitTvcHandler,
                );

                controller.addJavaScriptHandler(
                  handlerName: 'encodeInternalInput',
                  callback: encodeInternalInputHandler,
                );

                controller.addJavaScriptHandler(
                  handlerName: 'decodeInput',
                  callback: decodeInputHandler,
                );

                controller.addJavaScriptHandler(
                  handlerName: 'decodeEvent',
                  callback: decodeEventHandler,
                );

                controller.addJavaScriptHandler(
                  handlerName: 'decodeOutput',
                  callback: decodeOutputHandler,
                );

                controller.addJavaScriptHandler(
                  handlerName: 'decodeTransaction',
                  callback: decodeTransactionHandler,
                );

                controller.addJavaScriptHandler(
                  handlerName: 'decodeTransactionEvents',
                  callback: decodeTransactionEventsHandler,
                );

                controller.addJavaScriptHandler(
                  handlerName: 'estimateFees',
                  callback: estimateFeesHandler,
                );

                controller.addJavaScriptHandler(
                  handlerName: 'sendMessage',
                  callback: sendMessageHandler,
                );

                controller.addJavaScriptHandler(
                  handlerName: 'sendExternalMessage',
                  callback: sendExternalMessageHandler,
                );
              },
              onLoadStop: (controller, url) {
                controller.evaluateJavascript(source: snapshot.data!.last);
              },
              onConsoleMessage: (controller, consoleMessage) {
                debugPrint(consoleMessage.message);
              },
            );
          } else {
            return const CircularProgressIndicator();
          }
        },
      );
}
