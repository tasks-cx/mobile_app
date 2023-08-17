// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:tasks_cx/core/data/link.dart';
import 'package:tasks_cx/core/data/member.dart';

class Project {
  String projId;
  String parentId;
  String title;
  String summary;
  List<Link> links;
  String domain;
  Member creator;
  List<Member> owners;
  List<Member> members;
  Project({
    required this.projId,
    required this.parentId,
    required this.title,
    required this.summary,
    required this.links,
    required this.domain,
    required this.creator,
    required this.owners,
    required this.members,
  });

  Project copyWith({
    String? projId,
    String? parentId,
    String? title,
    String? summary,
    List<Link>? links,
    String? domain,
    Member? creator,
    List<Member>? owners,
    List<Member>? members,
  }) {
    return Project(
      projId: projId ?? this.projId,
      parentId: parentId ?? this.parentId,
      title: title ?? this.title,
      summary: summary ?? this.summary,
      links: links ?? this.links,
      domain: domain ?? this.domain,
      creator: creator ?? this.creator,
      owners: owners ?? this.owners,
      members: members ?? this.members,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'projId': projId,
      'parentId': parentId,
      'title': title,
      'summary': summary,
      'links': links.map((x) => x.toMap()).toList(),
      'domain': domain,
      'creator': creator.toMap(),
      'owners': owners.map((x) => x.toMap()).toList(),
      'members': members.map((x) => x.toMap()).toList(),
    };
  }

  factory Project.fromMap(Map<String, dynamic> map) {
    return Project(
      projId: map['projId'] as String,
      parentId: map['parentId'] as String,
      title: map['title'] as String,
      summary: map['summary'] as String,
      links: List<Link>.from(
        (map['links'] as List<int>).map<Link>(
          (x) => Link.fromMap(x as Map<String, dynamic>),
        ),
      ),
      domain: map['domain'] as String,
      creator: Member.fromMap(map['creator'] as Map<String, dynamic>),
      owners: List<Member>.from(
        (map['owners'] as List<int>).map<Member>(
          (x) => Member.fromMap(x as Map<String, dynamic>),
        ),
      ),
      members: List<Member>.from(
        (map['members'] as List<int>).map<Member>(
          (x) => Member.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Project.fromJson(String source) =>
      Project.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Project(projId: $projId, parentId: $parentId, title: $title, summary: $summary, links: $links, domain: $domain, creator: $creator, owners: $owners, members: $members)';
  }

  @override
  bool operator ==(covariant Project other) {
    if (identical(this, other)) return true;

    return other.projId == projId &&
        other.parentId == parentId &&
        other.title == title &&
        other.summary == summary &&
        listEquals(other.links, links) &&
        other.domain == domain &&
        other.creator == creator &&
        listEquals(other.owners, owners) &&
        listEquals(other.members, members);
  }

  @override
  int get hashCode {
    return projId.hashCode ^
        parentId.hashCode ^
        title.hashCode ^
        summary.hashCode ^
        links.hashCode ^
        domain.hashCode ^
        creator.hashCode ^
        owners.hashCode ^
        members.hashCode;
  }
}
