import 'package:dio/dio.dart';
import 'package:news_app_ui_setup/models/article_model.dart';

class NewsService {
  final Dio dio;
  NewsService(this.dio);

  Future<List<ArticleModel>> getNews({required String category}) async {
    Response response = await dio.get(
        "https://api.worldnewsapi.com/search-news?api-key=707f3651b8464c5ba6def8690cf1e09f&text=$category-in-egypt&country=eg&earliest-publish-date=2024-08-25&latest-publish-date=2024-08-25");
    Map<String, dynamic> jsonData = response.data;
    List<dynamic> articles = jsonData["news"];
    List<ArticleModel> articleList = [];
    for (var article in articles) {
      ArticleModel articleModel = ArticleModel(
          image: article["image"],
          title: article["title"],
          subTitle: article["summary"]);
      articleList.add(articleModel);
    }
    return articleList;
  }
}
