import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/models/article_model.dart';

class NewsTile extends StatelessWidget {
  const NewsTile({super.key, required this.articleModel});

  final ArticleModel articleModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.network(
              articleModel.image ??
                  "https://www.google.com/imgres?q=png%20pictures&imgurl=https%3A%2F%2Fpngimg.com%2Fd%2Fmario_PNG125.png&imgrefurl=https%3A%2F%2Fpngimg.com%2Fimage%2F30596&docid=8Ho-KxUjm4pB-M&tbnid=xFpKAoMQ3i7SZM&vet=12ahUKEwjI76XO_JGIAxWZVaQEHXSzFxkQM3oECH0QAA..i&w=1200&h=1098&hcb=2&ved=2ahUKEwjI76XO_JGIAxWZVaQEHXSzFxkQM3oECH0QAA",
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            )),
        const SizedBox(
          height: 12,
        ),
        Text(
          articleModel.title ?? '',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: Colors.black87,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          articleModel.subTitle ?? '',
          maxLines: 2,
          style: const TextStyle(color: Colors.grey, fontSize: 14),
        )
      ],
    );
  }
}
