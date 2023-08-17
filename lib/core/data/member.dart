// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SelfMember {
  String username;
  String domain;
  String publicKey;
  String privateKey;
  SelfMember({
    required this.username,
    required this.domain,
    required this.publicKey,
    required this.privateKey,
  });

  SelfMember copyWith({
    String? username,
    String? domain,
    String? publicKey,
    String? privateKey,
  }) {
    return SelfMember(
      username: username ?? this.username,
      domain: domain ?? this.domain,
      publicKey: publicKey ?? this.publicKey,
      privateKey: privateKey ?? this.privateKey,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'domain': domain,
      'publicKey': publicKey,
      'privateKey': privateKey,
    };
  }

  factory SelfMember.fromMap(Map<String, dynamic> map) {
    return SelfMember(
      username: map['username'] as String,
      domain: map['domain'] as String,
      publicKey: map['publicKey'] as String,
      privateKey: map['privateKey'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SelfMember.fromJson(String source) =>
      SelfMember.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Member(username: $username, domain: $domain, publicKey: $publicKey, privateKey: $privateKey)';
  }

  @override
  bool operator ==(covariant SelfMember other) {
    if (identical(this, other)) return true;

    return other.username == username &&
        other.domain == domain &&
        other.publicKey == publicKey &&
        other.privateKey == privateKey;
  }

  @override
  int get hashCode {
    return username.hashCode ^
        domain.hashCode ^
        publicKey.hashCode ^
        privateKey.hashCode;
  }
}

class Member {
  String username;
  String domain;
  String publicKey;
  Member({
    required this.username,
    required this.domain,
    required this.publicKey,
  });

  Member copyWith({
    String? username,
    String? domain,
    String? publicKey,
  }) {
    return Member(
      username: username ?? this.username,
      domain: domain ?? this.domain,
      publicKey: publicKey ?? this.publicKey,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'domain': domain,
      'publicKey': publicKey,
    };
  }

  factory Member.fromMap(Map<String, dynamic> map) {
    return Member(
      username: map['username'] as String,
      domain: map['domain'] as String,
      publicKey: map['publicKey'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Member.fromJson(String source) =>
      Member.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Member(username: $username, domain: $domain, publicKey: $publicKey)';

  @override
  bool operator ==(covariant Member other) {
    if (identical(this, other)) return true;

    return other.username == username &&
        other.domain == domain &&
        other.publicKey == publicKey;
  }

  @override
  int get hashCode => username.hashCode ^ domain.hashCode ^ publicKey.hashCode;
}
