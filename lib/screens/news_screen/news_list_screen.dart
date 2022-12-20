import "package:flutter/material.dart";
import 'package:flutter_mvvm/screens/news_screen/components/news_list.dart';
import 'package:flutter_mvvm/viewmodels/newsarticlelist_viewmodel.dart';
import 'package:provider/provider.dart';

class NewsListScreen extends StatefulWidget {
  const NewsListScreen({super.key});

  @override
  State<NewsListScreen> createState() => _NewsListScreenState();
}

class _NewsListScreenState extends State<NewsListScreen> {
  final textEditingController = TextEditingController();
  @override
  void initState() {
//  We set the listen parameter to false, since we are only invoking the method and we do not need to listen to anything
    Provider.of<NewsArticleListViewModel>(context, listen: false)
        .populateTopHeadlines();

    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<NewsArticleListViewModel>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text("Top News"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            TextField(
              controller: textEditingController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Search your keyword",
                icon: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.search),
                ),
                suffixIcon: IconButton(
                    onPressed: () {
                      textEditingController.clear();
                    },
                    icon: const Icon(Icons.clear)),
              ),
              onSubmitted: (inputs) {
                //fetch all articles related to keyword
                if (inputs.isNotEmpty) {
                  viewModel.searchArticle(inputs);
                }
                if (inputs.isEmpty) {
                  viewModel.populateTopHeadlines();
                }
              },
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: NewsList(articles: viewModel.newsArticleList),
            ),
          ],
        ));
  }
}
