import 'package:flutter/material.dart';
import 'package:news_now/models/artical_model.dart';
import 'package:news_now/views/article_detail_screen.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({super.key, required this.article});
  final ArticleModel article;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return ArticleDetailScreen();
            },
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 32),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: article.image != null
                  ? Image.network(
                      article.image!,
                      height: 180,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    )
                  : Image.asset(
                      'assets/images/test.avif',
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
            ),
            SizedBox(height: 8),
            Text(
              article.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.black87,
                fontFamily: 'Serif',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            article.subTitle != null
                ? Text(
                    article.subTitle!,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontFamily: 'Serif',
                      color: const Color.fromARGB(255, 102, 101, 101),
                      fontSize: 14,
                    ),
                  )
                : Text(''),
          ],
        ),
      ),
    );
  }
}
