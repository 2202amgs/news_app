import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
// import 'package:webviewx/webviewx.dart';

class WebViewScreen extends StatelessWidget {
  const WebViewScreen({Key? key, required this.url}) : super(key: key);
  final String url;

  @override
  Widget build(BuildContext context) {
    // late WebViewXController webviewController;
    return Scaffold(
      appBar: AppBar(),
      body: WebView(
        initialUrl: url,
      ),
      // body: WebViewX(
      //   height: double.infinity,
      //   width: double.infinity,
      //   initialContent: '<h2> Hello, world! </h2>',
      //   initialSourceType: SourceType.html,
      //   onWebViewCreated: (controller) => webviewController = controller,
      // ),
    );
  }
}
