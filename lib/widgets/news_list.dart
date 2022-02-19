import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:news_app/providers/news_provider.dart';
import 'package:news_app/widgets/news_list_item.dart';

class NewsList extends HookConsumerWidget {
  const NewsList({
    Key? key,
    required this.categoryId,
  }) : super(key: key);

  final int categoryId;

  @override
  Widget build(BuildContext context, ref) {
    final newsState = ref.watch(newsProvider);
    final scrollController = useScrollController();

    scrollController.addListener(() {
      bool isEndOfList =
          scrollController.offset == scrollController.position.maxScrollExtent;

      if (isEndOfList && newsState.hasMore && !newsState.isLoading) {
        ref.read(newsProvider.notifier).loadNews(
              page: newsState.page + 1,
              category: categoryId,
            );
      }
    });

    if (newsState.isLoading && newsState.page == 1) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return ListView.builder(
      controller: scrollController,
      padding: const EdgeInsets.all(16),
      itemExtent: 100,
      itemCount:
          newsState.hasMore ? newsState.news.length + 1 : newsState.news.length,
      itemBuilder: (context, index) {
        if (index >= newsState.news.length && newsState.hasMore) {
          return const Center(child: CircularProgressIndicator());
        }

        return NewsListItem(newsItem: newsState.news[index]);
      },
    );
  }
}
