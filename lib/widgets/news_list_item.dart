import 'package:flutter/material.dart';
import 'package:news_app/model/news.dart';

class NewsListItem extends StatelessWidget {
  const NewsListItem({
    Key? key,
    required this.newsItem,
  }) : super(key: key);
  final News newsItem;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      title: Text(newsItem.title),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Text(newsItem.date),
      ),
      leading: Container(
        width: 100,
        height: 300,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: NetworkImage(newsItem.image),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
