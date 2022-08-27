import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  const WebViewScreen({Key? key}) : super(key: key);

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  // ignore: unused_field
  late WebViewController _controller;
  var switchUrl = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        WebView(
          javascriptMode: JavascriptMode.unrestricted,
          initialUrl: 'https://amazon.in',
          onWebViewCreated: (controller) {
            _controller = controller;
          },
          onPageStarted: (url) {},
        ),
        Container(
          margin: const EdgeInsets.symmetric(
            vertical: 15.0,
            horizontal: 10.0,
          ),
          child: FloatingActionButton(
            backgroundColor: Theme.of(context).primaryColor,
            onPressed: () async {
              setState(() {
                switchUrl = !switchUrl;
              });
              _controller.loadUrl(
                  switchUrl ? 'https://youtube.com' : 'https://amazon.in');
            },
            child: const Icon(
              Icons.import_export,
              size: 30,
            ),
          ),
        ),
      ],
    );
  }
}
