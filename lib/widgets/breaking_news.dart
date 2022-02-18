import 'package:flutter/material.dart';
import 'package:news_app/widgets/breaking_news_item.dart';

class BreakingNews extends StatefulWidget {
  const BreakingNews({Key? key}) : super(key: key);

  @override
  _BreakingNewsState createState() => _BreakingNewsState();
}

class _BreakingNewsState extends State<BreakingNews> {
  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(viewportFraction: 0.9);
    return PageView(
      controller: controller,
      children: const <Widget>[
        BreakingNewsItem(),
        BreakingNewsItem(),
        BreakingNewsItem(),
      ],
    );
  }
}
