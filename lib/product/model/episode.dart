final class Episode {
  final int? id;
  final String? name;
  final String? airDate;
  final String? episode;
  final List<String>? characters;
  final String? url;
  final String? created;

  Episode({
    this.id,
    this.name,
    this.airDate,
    this.episode,
    this.characters,
    this.url,
    this.created,
  });

  factory Episode.fromJson(Map<String, dynamic> json) {
    return Episode(
      id: json['id'] as int?,
      name: json['name'] as String?,
      airDate: json['air_date'] as String?,
      episode: json['episode'] as String?,
      characters: (json['characters'] as List<dynamic>?)?.map((e) => e as String).toList(),
      url: json['url'] as String?,
      created: json['created'] as String?,
    );
  }

  @override
  String toString() =>
      "Episode(id: $id,name: $name,airDate: $airDate,episode: $episode,characters: $characters,url: $url,created: $created)";

  @override
  int get hashCode => Object.hash(id, name, airDate, episode, characters, url, created);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Episode &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          airDate == other.airDate &&
          episode == other.episode &&
          characters == other.characters &&
          url == other.url &&
          created == other.created;
}
