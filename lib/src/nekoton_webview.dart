import 'dart:async';
import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'callers/disconnected_caller.dart';

import 'callers/contract_state_changed_caller.dart';
import 'callers/logged_out_caller.dart';
import 'callers/network_changed_caller.dart';
import 'callers/permissions_changed_caller.dart';
import 'callers/transactions_found_caller.dart';
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
  final FutureOr<void> Function(NekotonWebviewController controller) onLoaded;

  const NekotonWebview({
    Key? key,
    required this.onLoaded,
  }) : super(key: key);

  @override
  _NekotonWebviewState createState() => _NekotonWebviewState();
}

class _NekotonWebviewState extends State<NekotonWebview> {
  @override
  Widget build(BuildContext context) => FutureBuilder<List<String>>(
        future: Future.wait<String>([
          rootBundle.loadString('packages/nekoton_flutter_webview/assets/js/main.js'),
          rootBundle.loadString('packages/nekoton_flutter_webview/assets/js/call.js'),
        ]),
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
              initialOptions: InAppWebViewGroupOptions(
                android: AndroidInAppWebViewOptions(
                  useHybridComposition: true,
                ),
              ),
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

                final nekotonWebviewController = NekotonWebviewController(controller);

                widget.onLoaded(nekotonWebviewController);
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

class NekotonWebviewController {
  final InAppWebViewController _inAppWebViewController;

  NekotonWebviewController(this._inAppWebViewController);

  void onDisconnected() => disconnectedCaller(_inAppWebViewController);

  void onTransactionsFound() => transactionsFoundCaller(_inAppWebViewController);

  void onContractStateChanged() => contractStateChangedCaller(_inAppWebViewController);

  void onNetworkChanged() => networkChangedCaller(_inAppWebViewController);

  void onPermissionsChanged() => permissionsChangedCaller(_inAppWebViewController);

  void onLoggedOut() => loggedOutCaller(_inAppWebViewController);
}
