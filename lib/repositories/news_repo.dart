import 'package:dio/dio.dart';
import 'package:news_app/model/news.dart';
import 'package:news_app/state/news_state.dart';

class NewsRepository {
  static Future<NewsState> fetch(int page) async {
    try {
      var response = await Dio().get(
          'https://ariananews.af/wp-json/wp/v2/posts?page=$page&per_page=5');

      return NewsState.success(
        news: (response.data as List).map((e) => News.fromMap(e)).toList(),
        count: int.parse((response.headers['x-wp-total'] as List)[0]),
        totalPage: int.parse((response.headers['x-wp-totalpages'] as List)[0]),
        page: page,
      );
    } catch (e) {
      return NewsState.error();
    }
  }
}
