import 'dart:convert';

class News {
  String id;
  String title;
  String description;
  String image;
  String date;
  String author;
  String content;
  News({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.date,
    required this.author,
    required this.content,
  });

  News copyWith({
    String? id,
    String? title,
    String? description,
    String? image,
    String? date,
    String? author,
    String? content,
  }) {
    return News(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      image: image ?? this.image,
      date: date ?? this.date,
      author: author ?? this.author,
      content: content ?? this.content,
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
      author: map['author']?.toString() ?? '',
      content: map['content']['rendered'] ?? '',
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
