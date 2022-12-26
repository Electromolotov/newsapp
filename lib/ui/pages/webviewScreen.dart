import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp/controllers/articleController.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  final String? uri;
  WebViewScreen({this.uri = '', Key? key}) : super(key: key);

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  int loadingPercentage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        WebViewWidget(
          controller: WebViewController()
            ..setJavaScriptMode(JavaScriptMode.unrestricted)
            ..setNavigationDelegate(NavigationDelegate(
              onPageStarted: (url) {
                setState(() {
                  loadingPercentage = 0;
                });
              },
              onProgress: (progress) {
                setState(() {
                  loadingPercentage = progress;
                });
              },
              onPageFinished: (url) {
                setState(() {
                  loadingPercentage = 100;
                });
              },
            ))
            ..loadRequest(Uri.parse(widget.uri.toString())),
        ),
        if (loadingPercentage < 100)
          Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.purple,
              color: Colors.transparent,
              value: loadingPercentage / 100.0,
            ),
          ),
      ]),
    );
  }
}
