// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:tasks_cx/core/data/member.dart';

class Comment {
  final Member member;
  final String content;
  Comment({
    required this.member,
    required this.content,
  });

  Comment copyWith({
    Member? member,
    String? content,
  }) {
    return Comment(
      member: member ?? this.member,
      content: content ?? this.content,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'member': member.toMap(),
      'content': content,
    };
  }

  factory Comment.fromMap(Map<String, dynamic> map) {
    return Comment(
      member: Member.fromMap(map['member'] as Map<String, dynamic>),
      content: map['content'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Comment.fromJson(String source) =>
      Comment.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Comment(member: $member, content: $content)';

  @override
  bool operator ==(covariant Comment other) {
    if (identical(this, other)) return true;

    return other.member == member && other.content == content;
  }

  @override
  int get hashCode => member.hashCode ^ content.hashCode;
}
