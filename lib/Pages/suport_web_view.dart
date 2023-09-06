import 'package:flutter/material.dart';
import 'package:virtual_exchange/Providers/providers.dart';
import 'package:virtual_exchange/app_theme.dart';
import 'package:virtual_exchange/utils.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SupportWebView extends StatefulWidget {
  const SupportWebView({super.key});

  @override
  State<SupportWebView> createState() => _SupportWebViewState();
}

class _SupportWebViewState extends State<SupportWebView> with TickerProviderStateMixin {
  WebViewController? webController;
  late AnimationController animationController;
  double progress = 0.0;

  void initWebController() {
    progress = 0.0;
    webController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(AppColors.scaffoldBackgroundColorDarkMode)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            this.progress = progress / 100;
            logger.i(this.progress);
            setState(() {});
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse('https://flutter.dev'));
  }

  @override
  void initState() {
    initWebController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              initWebController();
            },
            icon: Icon(
              Icons.refresh,
              color: themeProvider.darkMode ? Colors.white : Colors.black,
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          WebViewWidget(controller: webController!),
          if (progress != 0.0 && progress != 1.0)
            Positioned(
              child: LinearProgressIndicator(
                value: progress,
                color: Colors.red,
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.yellow),
              ),
            )
        ],
      ),
    );
  }
}
