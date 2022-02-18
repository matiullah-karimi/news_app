import 'package:flutter/material.dart';
import 'package:news_app/widgets/news_list_item.dart';

class NewsList extends StatelessWidget {
  const NewsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      itemExtent: 100,
      padding: const EdgeInsets.all(16),
      children: [
        NewsListItem(),
        NewsListItem(),
        NewsListItem(),
        NewsListItem(),
        NewsListItem(),
        NewsListItem(),
        NewsListItem(),
        NewsListItem(),
        NewsListItem(),
        NewsListItem(),
        NewsListItem(),
      ],
    );
  }
}
