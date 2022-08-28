import 'dart:io';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomePage extends StatefulWidget {
  final String url;
  HomePage({required this.url});

  @override
  BrowserState createState() => BrowserState();
}

class BrowserState extends State<HomePage> {
  WebViewController? webViewController;
  final _cookieManager = CookieManager();

  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WebView(
        initialUrl: widget.url,
        javascriptMode: JavascriptMode.unrestricted,
        allowsInlineMediaPlayback: true,
        debuggingEnabled: true,
        userAgent: "",
        onWebViewCreated: (controller) {
          webViewController = controller;
        },
        initialMediaPlaybackPolicy: AutoMediaPlaybackPolicy.always_allow,
      ),
    );
  }
}
