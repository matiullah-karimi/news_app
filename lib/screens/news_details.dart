import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:news_app/model/news.dart';
import 'package:news_app/widgets/breaking_news_item.dart';
import 'package:flutter_html/flutter_html.dart';

class NewsDetails extends ConsumerWidget {
  const NewsDetails({Key? key, required this.newsItem}) : super(key: key);

  final News newsItem;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: BreakingNewsItem(
                    newsItem: newsItem,
                    height: MediaQuery.of(context).size.height * 0.4,
                    radius: 0,
                    margin: EdgeInsets.zero,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  margin: EdgeInsets.only(
                      top: (MediaQuery.of(context).size.height * 0.4) - 24),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildBadge(
                              icon: CircleAvatar(
                                backgroundImage: NetworkImage(newsItem.image),
                              ),
                              text: 'Matiullah K',
                              active: true),
                          _buildBadge(
                            icon: Icon(
                              Icons.watch_later_outlined,
                              color: Colors.blue.shade800,
                            ),
                            text: newsItem.formattedDate,
                          ),
                          _buildBadge(
                            icon: Icon(
                              Icons.remove_red_eye_outlined,
                              color: Colors.blue.shade800,
                            ),
                            text: '223',
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Html(
                        data: newsItem.content,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 16,
                  left: 16,
                  child: InkWell(
                    onTap: () => Navigator.of(context).pop(),
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.grey.shade100,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildBadge(
      {required Widget icon, required String text, bool active = false}) {
    return Container(
      padding: const EdgeInsets.all(8),
      height: 50,
      decoration: BoxDecoration(
        color: active ? Colors.blue.shade800 : Colors.blue.shade100,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          icon,
          const SizedBox(width: 8),
          Text(
            text,
            style: TextStyle(
              color: active ? Colors.white : Colors.grey.shade700,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
