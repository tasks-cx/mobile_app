// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:tasks_cx/core/data/comment.dart';
import 'package:tasks_cx/core/data/member.dart';
import 'package:tasks_cx/core/data/project_model.dart';

class Task {
  final String uid;
  final String domain;
  final String hash;
  final Member creator;
  final Project project;
  final String parentId;
  final String created; // timestamp
  final String updated; // timestamp
  final String title;
  final String status;
  final Member assignee;
  final List<Member> followers;
  final String due;
  final List<String> tags;
  final String body;
  final List<String> attachments;
  final List<Comment> comments;
  Task({
    required this.uid,
    required this.domain,
    required this.hash,
    required this.creator,
    required this.project,
    required this.parentId,
    required this.created,
    required this.updated,
    required this.title,
    required this.status,
    required this.assignee,
    required this.followers,
    required this.due,
    required this.tags,
    required this.body,
    required this.attachments,
    required this.comments,
  });

  Task copyWith({
    String? uid,
    String? domain,
    String? hash,
    Member? creator,
    Project? project,
    String? parentId,
    String? created,
    String? updated,
    String? title,
    String? status,
    Member? assignee,
    List<Member>? followers,
    String? due,
    List<String>? tags,
    String? body,
    List<String>? attachments,
    List<Comment>? comments,
  }) {
    return Task(
      uid: uid ?? this.uid,
      domain: domain ?? this.domain,
      hash: hash ?? this.hash,
      creator: creator ?? this.creator,
      project: project ?? this.project,
      parentId: parentId ?? this.parentId,
      created: created ?? this.created,
      updated: updated ?? this.updated,
      title: title ?? this.title,
      status: status ?? this.status,
      assignee: assignee ?? this.assignee,
      followers: followers ?? this.followers,
      due: due ?? this.due,
      tags: tags ?? this.tags,
      body: body ?? this.body,
      attachments: attachments ?? this.attachments,
      comments: comments ?? this.comments,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'domain': domain,
      'hash': hash,
      'creator': creator.toMap(),
      'project': project.toMap(),
      'parentId': parentId,
      'created': created,
      'updated': updated,
      'title': title,
      'status': status,
      'assignee': assignee.toMap(),
      'followers': followers.map((x) => x.toMap()).toList(),
      'due': due,
      'tags': tags,
      'body': body,
      'attachments': attachments,
      'comments': comments.map((x) => x.toMap()).toList(),
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
        uid: map['uid'] as String,
        domain: map['domain'] as String,
        hash: map['hash'] as String,
        creator: Member.fromMap(map['creator'] as Map<String, dynamic>),
        project: Project.fromMap(map['project'] as Map<String, dynamic>),
        parentId: map['parentId'] as String,
        created: map['created'] as String,
        updated: map['updated'] as String,
        title: map['title'] as String,
        status: map['status'] as String,
        assignee: Member.fromMap(map['assignee'] as Map<String, dynamic>),
        followers: List<Member>.from(
          (map['followers'] as List<int>).map<Member>(
            (x) => Member.fromMap(x as Map<String, dynamic>),
          ),
        ),
        body: map['body'] as String,
        comments: List<Comment>.from(
          (map['comments'] as List<String>).map<Comment>(
            (x) => Comment.fromMap(x as Map<String, dynamic>),
          ),
        ),
        due: map['due'] as String,
        tags: List<String>.from((map['tags'] as List<String>)),
        attachments: List<String>.from(
          (map['attachments'] as List<String>),
        ));
  }

  String toJson() => json.encode(toMap());

  factory Task.fromJson(String source) =>
      Task.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Task(uid: $uid, domain: $domain, hash: $hash, creator: $creator, project: $project, parentId: $parentId, created: $created, updated: $updated, title: $title, status: $status, assignee: $assignee, followers: $followers, due: $due, tags: $tags, body: $body, attachments: $attachments, comments: $comments)';
  }

  @override
  bool operator ==(covariant Task other) {
    if (identical(this, other)) return true;

    return other.uid == uid &&
        other.domain == domain &&
        other.hash == hash &&
        other.creator == creator &&
        other.project == project &&
        other.parentId == parentId &&
        other.created == created &&
        other.updated == updated &&
        other.title == title &&
        other.status == status &&
        other.assignee == assignee &&
        listEquals(other.followers, followers) &&
        other.due == due &&
        listEquals(other.tags, tags) &&
        other.body == body &&
        listEquals(other.attachments, attachments) &&
        listEquals(other.comments, comments);
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        domain.hashCode ^
        hash.hashCode ^
        creator.hashCode ^
        project.hashCode ^
        parentId.hashCode ^
        created.hashCode ^
        updated.hashCode ^
        title.hashCode ^
        status.hashCode ^
        assignee.hashCode ^
        followers.hashCode ^
        due.hashCode ^
        tags.hashCode ^
        body.hashCode ^
        attachments.hashCode ^
        comments.hashCode;
  }
}
