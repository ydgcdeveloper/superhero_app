class SuperheroSearchResponse {
  final String response;
  final String? resultsFor;
  final List<SuperheroResponse>? results;
  final String? error;

  SuperheroSearchResponse({
    required this.response,
    this.resultsFor,
    this.results,
    this.error,
  });

  factory SuperheroSearchResponse.fromJson(Map<String, dynamic> json) {
    return SuperheroSearchResponse(
      response: json['response'] as String? ?? '',
      resultsFor: json['results-for'] as String?,
      results:
          (json['results'] as List<dynamic>?)
              ?.map((e) => SuperheroResponse.fromJson(e))
              .toList(),
      error: json['error'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'response': response,
        if (resultsFor != null) 'results-for': resultsFor,
        if (results != null) 'results': results?.map((e) => e.toJson()).toList(),
        if (error != null) 'error': error,
      };
}

class SuperheroResponse {
  final String id;
  final String name;
  final Powerstats powerstats;
  final Biography biography;
  final Appearance appearance;
  final Work work;
  final Connections connections;
  final SuperheroImage image;

  SuperheroResponse({
    required this.id,
    required this.name,
    required this.powerstats,
    required this.biography,
    required this.appearance,
    required this.work,
    required this.connections,
    required this.image,
  });

  factory SuperheroResponse.fromJson(Map<String, dynamic> json) {
    return SuperheroResponse(
      id: json['id'] as String,
      name: json['name'] as String,
      powerstats: Powerstats.fromJson(json['powerstats']),
      biography: Biography.fromJson(json['biography']),
      appearance: Appearance.fromJson(json['appearance']),
      work: Work.fromJson(json['work']),
      connections: Connections.fromJson(json['connections']),
      image: SuperheroImage.fromJson(json['image']),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'powerstats': powerstats.toJson(),
    'biography': biography.toJson(),
    'appearance': appearance.toJson(),
    'work': work.toJson(),
    'connections': connections.toJson(),
    'image': image.toJson(),
  };
}

class Powerstats {
  final String intelligence;
  final String strength;
  final String speed;
  final String durability;
  final String power;
  final String combat;

  Powerstats({
    required this.intelligence,
    required this.strength,
    required this.speed,
    required this.durability,
    required this.power,
    required this.combat,
  });

  factory Powerstats.fromJson(Map<String, dynamic> json) => Powerstats(
    intelligence: json['intelligence'] as String,
    strength: json['strength'] as String,
    speed: json['speed'] as String,
    durability: json['durability'] as String,
    power: json['power'] as String,
    combat: json['combat'] as String,
  );

  Map<String, dynamic> toJson() => {
    'intelligence': intelligence,
    'strength': strength,
    'speed': speed,
    'durability': durability,
    'power': power,
    'combat': combat,
  };
}

class Biography {
  final String fullName;
  final String alterEgos;
  final List<String> aliases;
  final String placeOfBirth;
  final String firstAppearance;
  final String publisher;
  final String alignment;

  Biography({
    required this.fullName,
    required this.alterEgos,
    required this.aliases,
    required this.placeOfBirth,
    required this.firstAppearance,
    required this.publisher,
    required this.alignment,
  });

  factory Biography.fromJson(Map<String, dynamic> json) => Biography(
    fullName: json['full-name'] as String,
    alterEgos: json['alter-egos'] as String,
    aliases: List<String>.from(json['aliases'] ?? []),
    placeOfBirth: json['place-of-birth'] as String,
    firstAppearance: json['first-appearance'] as String,
    publisher: json['publisher'] as String,
    alignment: json['alignment'] as String,
  );

  Map<String, dynamic> toJson() => {
    'full-name': fullName,
    'alter-egos': alterEgos,
    'aliases': aliases,
    'place-of-birth': placeOfBirth,
    'first-appearance': firstAppearance,
    'publisher': publisher,
    'alignment': alignment,
  };
}

class Appearance {
  final String gender;
  final String race;
  final List<String> height;
  final List<String> weight;
  final String eyeColor;
  final String hairColor;

  Appearance({
    required this.gender,
    required this.race,
    required this.height,
    required this.weight,
    required this.eyeColor,
    required this.hairColor,
  });

  factory Appearance.fromJson(Map<String, dynamic> json) => Appearance(
    gender: json['gender'] as String,
    race: json['race'] as String,
    height: List<String>.from(json['height'] ?? []),
    weight: List<String>.from(json['weight'] ?? []),
    eyeColor: json['eye-color'] as String,
    hairColor: json['hair-color'] as String,
  );

  Map<String, dynamic> toJson() => {
    'gender': gender,
    'race': race,
    'height': height,
    'weight': weight,
    'eye-color': eyeColor,
    'hair-color': hairColor,
  };
}

class Work {
  final String occupation;
  final String base;

  Work({required this.occupation, required this.base});

  factory Work.fromJson(Map<String, dynamic> json) => Work(
    occupation: json['occupation'] as String,
    base: json['base'] as String,
  );

  Map<String, dynamic> toJson() => {'occupation': occupation, 'base': base};
}

class Connections {
  final String groupAffiliation;
  final String relatives;

  Connections({required this.groupAffiliation, required this.relatives});

  factory Connections.fromJson(Map<String, dynamic> json) => Connections(
    groupAffiliation: json['group-affiliation'] as String,
    relatives: json['relatives'] as String,
  );

  Map<String, dynamic> toJson() => {
    'group-affiliation': groupAffiliation,
    'relatives': relatives,
  };
}

class SuperheroImage {
  final String url;

  SuperheroImage({required this.url});

  factory SuperheroImage.fromJson(Map<String, dynamic> json) =>
      SuperheroImage(url: json['url'] as String);

  Map<String, dynamic> toJson() => {'url': url};
}
