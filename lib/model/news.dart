import 'dart:convert';

import 'package:news_app/model/category.dart';
import 'package:timeago/timeago.dart' as timeago;

class News {
  String id;
  String title;
  String description;
  String image;
  String date;
  String author;
  String content;
  List<Category> categories;

  News({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.date,
    required this.author,
    required this.content,
    required this.categories,
  });

  String get formattedDate {
    return timeago.format(DateTime.parse(date));
  }

  News copyWith({
    String? id,
    String? title,
    String? description,
    String? image,
    String? date,
    String? author,
    String? content,
    List<Category>? categories,
  }) {
    return News(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      image: image ?? this.image,
      date: date ?? this.date,
      author: author ?? this.author,
      content: content ?? this.content,
      categories: categories ?? this.categories,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'image': image,
      'date': date,
      'author': author,
      'content': content,
    };
  }

  factory News.fromMap(Map<String, dynamic> map) {
    return News(
      id: map['id']?.toString() ?? '',
      title: map['title']['rendered'] ?? '',
      description: map['excerpt']['rendered'] ?? '',
      image: map['mobiconnector_feature_image']['source_url'] ?? '',
      date: map['date'] ?? '',
      author: map['mobiconnector_author_name'] ?? '',
      content: map['content']['rendered'] ?? '',
      categories: List<Category>.from(
          map['mobiconnector_categories']?.map((x) => Category.fromNewsMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory News.fromJson(String source) => News.fromMap(json.decode(source));

  @override
  String toString() {
    return 'News(id: $id, title: $title, description: $description, image: $image, date: $date, author: $author, content: $content)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is News &&
        other.id == id &&
        other.title == title &&
        other.description == description &&
        other.image == image &&
        other.date == date &&
        other.author == author &&
        other.content == content;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        description.hashCode ^
        image.hashCode ^
        date.hashCode ^
        author.hashCode ^
        content.hashCode;
  }
}
