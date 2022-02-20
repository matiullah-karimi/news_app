import 'package:flutter/material.dart';
import 'package:news_app/model/news.dart';
import 'package:news_app/screens/news_details.dart';

class BreakingNewsItem extends StatelessWidget {
  const BreakingNewsItem({
    Key? key,
    required this.newsItem,
    this.height,
    this.radius,
    this.padding,
    this.margin,
  }) : super(key: key);

  final News newsItem;
  final double? height;
  final double? radius;
  final EdgeInsets? margin;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => NewsDetails(newsItem: newsItem),
        ),
      ),
      child: Container(
        height: height,
        padding: padding ??
            const EdgeInsets.only(right: 64, left: 24, top: 16, bottom: 16),
        margin: margin ?? const EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.5),
              BlendMode.dstATop,
            ),
            image: NetworkImage(newsItem.image),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(radius ?? 16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Chip(label: Text(newsItem.categories[0].name)),
                const SizedBox(width: 8),
                Icon(
                  Icons.fiber_manual_record,
                  size: 8,
                  color: Colors.grey.shade300,
                ),
                const SizedBox(width: 8),
                Text(
                  newsItem.formattedDate,
                  style: TextStyle(
                    color: Colors.grey.shade300,
                  ),
                )
              ],
            ),
            const SizedBox(height: 16),
            Text(
              newsItem.title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.grey.shade100,
              ),
            )
          ],
        ),
      ),
    );
  }
}
