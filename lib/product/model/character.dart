final class Character {
  final int? id;
  final String? name;
  final String? status;
  final String? species;
  final String? type;
  final String? gender;
  final Origin? origin;
  final LocationLite? location;
  final String? image;
  final List<String>? episode;
  final String? url;
  final String? created;

  Character({
    this.id,
    this.name,
    this.status,
    this.species,
    this.type,
    this.gender,
    this.origin,
    this.location,
    this.image,
    this.episode,
    this.url,
    this.created,
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      id: json['id'] as int?,
      name: json['name'] as String?,
      status: json['status'] as String?,
      species: json['species'] as String?,
      type: json['type'] as String?,
      gender: json['gender'] as String?,
      origin: json['origin'] == null ? null : Origin.fromJson(json['origin'] as Map<String, dynamic>),
      location: json['location'] == null ? null : LocationLite.fromJson(json['location'] as Map<String, dynamic>),
      image: json['image'] as String?,
      episode: (json['episode'] as List<dynamic>?)?.map((e) => e as String).toList(),
      url: json['url'] as String?,
      created: json['created'] as String?,
    );
  }

  @override
  String toString() =>
      "Character(id: $id,name: $name,status: $status,species: $species,type: $type,gender: $gender,origin: $origin,location: $location,image: $image,episode: $episode,url: $url,created: $created)";

  @override
  int get hashCode =>
      Object.hash(id, name, status, species, type, gender, origin, location, image, episode, url, created);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Character &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          status == other.status &&
          species == other.species &&
          type == other.type &&
          gender == other.gender &&
          origin == other.origin &&
          location == other.location &&
          image == other.image &&
          episode == other.episode &&
          url == other.url &&
          created == other.created;
}

class Origin {
  final String? name;
  final String? url;

  Origin({
    this.name,
    this.url,
  });

  factory Origin.fromJson(Map<String, dynamic> json) {
    return Origin(
      name: json['name'] as String?,
      url: json['url'] as String?,
    );
  }

  @override
  String toString() => "Origin(name: $name,url: $url)";

  @override
  int get hashCode => Object.hash(name, url);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Origin && runtimeType == other.runtimeType && name == other.name && url == other.url;
}

class LocationLite {
  final String? name;
  final String? url;

  LocationLite({
    this.name,
    this.url,
  });

  factory LocationLite.fromJson(Map<String, dynamic> json) {
    return LocationLite(
      name: json['name'] as String?,
      url: json['url'] as String?,
    );
  }

  @override
  String toString() => "Location(name: $name,url: $url)";

  @override
  int get hashCode => Object.hash(name, url);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocationLite && runtimeType == other.runtimeType && name == other.name && url == other.url;
}
