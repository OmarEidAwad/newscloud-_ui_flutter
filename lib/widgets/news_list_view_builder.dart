import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/services/news_service.dart';
import 'package:news_app_ui_setup/widgets/news_list_view.dart';

class NewsListViewBuilder extends StatefulWidget {
  const NewsListViewBuilder({
    super.key,
  });

  @override
  State<NewsListViewBuilder> createState() => _NewsListViewBuilderState();
}

class _NewsListViewBuilderState extends State<NewsListViewBuilder> {
  // bool isloading = true;
  // List<ArticleModel> articles = [];
  // @override
  // void initState() {
  //   super.initState();
  //   getGeneralNews();
  // }

  // Future<void> getGeneralNews() async {
  //   articles = await NewsService(Dio()).getNews();
  //   setState(() {});
  //   isloading = false;
  // }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: NewsService(Dio()).getNews(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return NewsListView(
          articles: snapshot.data ?? [],
        );
      },
    );

    // return isloading
    //     ? const SliverToBoxAdapter(
    //         child: Center(child: CircularProgressIndicator()))
    //     : SliverList(
    //         delegate: SliverChildBuilderDelegate(
    //           childCount: articles.length,
    //           (context, index) {
    //             return Padding(
    //               padding: const EdgeInsets.only(bottom: 22),
    //               child: NewsTile(
    //                 articleModel: articles[index],
    //               ),
    //             );
    //           },
    //         ),
    //       );
  }
}
