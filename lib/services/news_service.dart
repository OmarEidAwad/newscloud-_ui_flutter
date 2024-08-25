import 'package:dio/dio.dart';
import 'package:news_app_ui_setup/models/article_model.dart';

class NewsService {
  final Dio dio;
  NewsService(this.dio);

  Future<List<ArticleModel>> getNews() async {
    Response response = await dio.get(
        "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=f072c371523a4a7d879b3a3674320bc5");
    Map<String, dynamic> jsonData = response.data;
    List<dynamic> articles = jsonData["articles"];
    List<ArticleModel> articleList = [];
    for (var article in articles) {
      ArticleModel articleModel = ArticleModel(
          image: article["urlToImage"],
          title: article["title"],
          subTitle: article["description"]);
      articleList.add(articleModel);
    }
    return articleList;
  }
}
