import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:news_app/model/news.dart';

class NewsState {
  final List<News> news;
  final bool isLoading;
  final bool isError;
  final int page;
  final int totalPage;
  final int count;

  NewsState({
    required this.news,
    required this.isLoading,
    required this.isError,
    required this.page,
    required this.totalPage,
    required this.count,
  });

  factory NewsState.initial() {
    return NewsState(
      news: [],
      isLoading: false,
      isError: false,
      page: 0,
      totalPage: 0,
      count: 0,
    );
  }

  NewsState copyWith({
    List<News>? news,
    bool? isLoading,
    bool? isError,
    int? page,
    int? totalPage,
    int? count,
  }) {
    return NewsState(
      news: news ?? this.news,
      isLoading: isLoading ?? this.isLoading,
      isError: isError ?? this.isError,
      page: page ?? this.page,
      totalPage: totalPage ?? this.totalPage,
      count: count ?? this.count,
    );
  }

  //success state
  factory NewsState.success({
    required List<News> news,
    required int page,
    required int totalPage,
    required int count,
  }) {
    return NewsState(
      news: news,
      isLoading: false,
      isError: false,
      page: page,
      totalPage: totalPage,
      count: count,
    );
  }

  factory NewsState.error() {
    return NewsState(
      news: [],
      isLoading: false,
      isError: true,
      page: 1,
      totalPage: 1,
      count: 0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'news': news.map((x) => x.toMap()).toList(),
      'isLoading': isLoading,
      'isError': isError,
      'page': page,
      'totalPage': totalPage,
      'count': count,
    };
  }

  factory NewsState.fromMap(Map<String, dynamic> map) {
    return NewsState(
      news: List<News>.from(map['news']?.map((x) => News.fromMap(x))),
      isLoading: map['isLoading'] ?? false,
      isError: map['isError'] ?? false,
      page: map['page']?.toInt() ?? 0,
      totalPage: map['totalPage']?.toInt() ?? 0,
      count: map['count']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory NewsState.fromJson(String source) =>
      NewsState.fromMap(json.decode(source));

  @override
  String toString() {
    return 'NewsState(news: $news, isLoading: $isLoading, isError: $isError, page: $page, totalPage: $totalPage, count: $count)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is NewsState &&
        listEquals(other.news, news) &&
        other.isLoading == isLoading &&
        other.isError == isError &&
        other.page == page &&
        other.totalPage == totalPage &&
        other.count == count;
  }

  @override
  int get hashCode {
    return news.hashCode ^
        isLoading.hashCode ^
        isError.hashCode ^
        page.hashCode ^
        totalPage.hashCode ^
        count.hashCode;
  }
}
