import 'dart:convert';

import 'package:flutter_news/data/models/article_model.dart';
import 'package:flutter_news/data/models/articles_model.dart';
import 'package:http/http.dart' as http;

class NewsApi {
  final String apiKey = 'c015ec3f6abd4831a5191151866a3002';

  Future<List<Article>?> fetchArticles() async {
    try {
      http.Response response = await http.get(Uri.parse(
          'https://newsapi.org/v2/top-headlines?country=us&apiKey=$apiKey'));

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        ArticlesList articlesList = ArticlesList.fromJson(data);
        List<Article> articlesLists =
            articlesList.articles.map((e) => Article.fromJson(e)).toList();
        return articlesLists;
      } else {
        print('status code = ${response.statusCode}');
      }
    } catch (ex) {
      print(' Errors = $ex');
    }
  }
}
