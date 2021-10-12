// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_news/data/services/news_services.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () async {
        NewsApi newsApi = NewsApi();
        var articles = await newsApi.fetchArticles();

        print(articles);
      }),
    );
  }
}
