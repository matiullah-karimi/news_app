import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/providers/news_provider.dart';
import 'package:news_app/widgets/news_list_item.dart';

class NewsList extends ConsumerWidget {
  const NewsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final newsState = ref.watch(newsProvider);

    if (newsState.isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemExtent: 100,
      itemCount: newsState.news.length,
      itemBuilder: (context, index) {
        return NewsListItem(newsItem: newsState.news[index]);
      },
    );
  }
}
