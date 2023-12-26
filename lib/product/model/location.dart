final class Location {
  final int? id;
  final String? name;
  final String? type;
  final String? dimension;
  final List<String>? residents;
  final String? url;
  final String? created;

  Location({
    this.id,
    this.name,
    this.type,
    this.dimension,
    this.residents,
    this.url,
    this.created,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      id: json['id'] as int?,
      name: json['name'] as String?,
      type: json['type'] as String?,
      dimension: json['dimension'] as String?,
      residents: (json['residents'] as List<dynamic>?)?.map((e) => e as String).toList(),
      url: json['url'] as String?,
      created: json['created'] as String?,
    );
  }

  @override
  String toString() =>
      "Response(id: $id,name: $name,type: $type,dimension: $dimension,residents: $residents,url: $url,created: $created)";

  @override
  int get hashCode => Object.hash(id, name, type, dimension, residents, url, created);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Location &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          type == other.type &&
          dimension == other.dimension &&
          residents == other.residents &&
          url == other.url &&
          created == other.created;
}
