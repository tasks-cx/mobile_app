// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Link {
  final Uri url;
  final String label;
  Link({
    required this.url,
    required this.label,
  });

  Link copyWith({
    Uri? url,
    String? label,
  }) {
    return Link(
      url: url ?? this.url,
      label: label ?? this.label,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'url': url.toString(),
      'label': label,
    };
  }

  factory Link.fromMap(Map<String, dynamic> map) {
    return Link(
      url: Uri.parse(map['url'] as String),
      label: map['label'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Link.fromJson(String source) =>
      Link.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Link(url: $url, label: $label)';

  @override
  bool operator ==(covariant Link other) {
    if (identical(this, other)) return true;

    return other.url == url && other.label == label;
  }

  @override
  int get hashCode => url.hashCode ^ label.hashCode;
}
