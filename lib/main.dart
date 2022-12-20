import 'package:flutter/material.dart';
import 'package:flutter_mvvm/screens/news_screen/news_list_screen.dart';
import 'package:flutter_mvvm/viewmodels/newsarticlelist_viewmodel.dart';
import "package:provider/provider.dart";

void main() {
  runApp(const AppWidget());
}

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NewsArticleListViewModel(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: NewsListScreen(),
      ),
    );
  }
}
