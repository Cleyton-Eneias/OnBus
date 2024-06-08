import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  String url = 'https://netodedanda.github.io/pi/';


  @override
  Widget build(BuildContext context) {

    WebViewController controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Implementar uma barrinha dps
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {

            return NavigationDecision.navigate;

          },
        ),
      )..loadRequest(Uri.parse(url));


    return Scaffold(
      //appBar: AppBar(title: Center(child: Text('Tituluzin'))),
      body: WebViewWidget(controller: controller),
    );
  }
}
