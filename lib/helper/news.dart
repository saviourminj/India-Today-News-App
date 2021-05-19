import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/constants/const.dart';
import 'package:news_app/models/article_model.dart';

class News {
  List<ArticleModel> newsArticle = [];

  String apiURL =
      'https://newsapi.org/v2/top-headlines?country=in&apiKey=$apiKey';

  Future<void> getNews() async {
    http.Response response = await http.get(apiURL);
    var jsonData = jsonDecode(response.body);

    if (response.statusCode == 200) {
      jsonData['articles'].forEach((article) {
        if(article['urlToImage'] != null && article['description'] != null){
          ArticleModel articleModel = ArticleModel(
            title: article['title'],
            description: article['description'],
            urlToImage: article['urlToImage'],
            url: article['url'],
            author: article['author'],
            content: article['content'],
          );
          newsArticle.add(articleModel);
        }
        },
      );
    }else print(response.statusCode);
  }
}

class CategoryNewsClass{
  List<ArticleModel> newsArticle = [];

  String apiURL ='';

  Future<void> getCategoryForNews(String category) async {
    apiURL ='https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=e676cd15b33e4ef092636b22f64f1d47';

    http.Response response = await http.get(apiURL);
    var jsonData = jsonDecode(response.body);

    if (response.statusCode == 200) {
      jsonData['articles'].forEach((article) {
        if(article['urlToImage'] != null && article['description'] != null){
          ArticleModel articleModel = ArticleModel(
            title: article['title'],
            description: article['description'],
            urlToImage: article['urlToImage'],
            url: article['url'],
            author: article['author'],
            content: article['content'],
          );
          newsArticle.add(articleModel);
        }
      },
      );
    }else print(response.statusCode);
  }
}

class SearchedKeyword{
  List<ArticleModel> newsArticle = [];

  String apiURL ='';

  Future<void> getSearchResult(String keyword) async {
    apiURL ='https://newsapi.org/v2/everything?q=$keyword&apiKey=$apiKey';

    http.Response response = await http.get(apiURL);
    var jsonData = jsonDecode(response.body);

    if (response.statusCode == 200) {
      jsonData['articles'].forEach((article) {
        if(article['urlToImage'] != null && article['description'] != null){
          ArticleModel articleModel = ArticleModel(
            title: article['title'],
            description: article['description'],
            urlToImage: article['urlToImage'],
            url: article['url'],
            author: article['author'],
            content: article['content'],
          );
          newsArticle.add(articleModel);
        }
      },
      );
    }else print(response.statusCode);
  }
}
