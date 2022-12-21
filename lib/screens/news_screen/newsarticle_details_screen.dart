import "package:flutter/material.dart";
import 'package:flutter_mvvm/viewmodels/newsarticle_viewmodel.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsArticleDetailsScreen extends StatelessWidget {
  final NewsArticleViewModel article;
  NewsArticleDetailsScreen({super.key, required this.article});

  late final webViewController = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000))
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
          // Update loading bar.
          print(progress);
        },
        onPageStarted: (String url) {},
        onPageFinished: (String url) {},
        onWebResourceError: (WebResourceError error) {},
        onNavigationRequest: (NavigationRequest request) {
          if (request.url.startsWith('https://www.youtube.com/')) {
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ),
    )
    ..loadRequest(Uri.parse(article.url));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          article.title.length <= 25
              ? article.title
              : "${article.title.substring(0, 25)}...",
        ),
      ),
      body: WebViewWidget(
        controller: webViewController,
      ),
    );
  }
}
