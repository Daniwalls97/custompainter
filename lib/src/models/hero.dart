// To parse this JSON data, do
//
//     final hero = heroFromJson(jsonString);

import 'dart:convert';

List<SuperHero> heroFromJson(String str) =>
    List<SuperHero>.from(json.decode(str).map((x) => SuperHero.fromJson(x)));

String heroToJson(List<SuperHero> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SuperHero {
  SuperHero({
    required this.id,
    required this.name,
    required this.slug,
    required this.powerstats,
    required this.work,
    required this.connections,
    required this.images,
  });

  int id;
  String name;
  String slug;
  Powerstats powerstats;
  Work work;
  Connections connections;
  Images images;

  factory SuperHero.fromJson(Map<String, dynamic> json) => SuperHero(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        powerstats: Powerstats.fromJson(json["powerstats"]),
        work: Work.fromJson(json["work"]),
        connections: Connections.fromJson(json["connections"]),
        images: Images.fromJson(json["images"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "powerstats": powerstats.toJson(),
        "work": work.toJson(),
        "connections": connections.toJson(),
        "images": images.toJson(),
      };
}

class Connections {
  Connections({
    required this.groupAffiliation,
    required this.relatives,
  });

  String groupAffiliation;
  String relatives;

  factory Connections.fromJson(Map<String, dynamic> json) => Connections(
        groupAffiliation: json["groupAffiliation"],
        relatives: json["relatives"],
      );

  Map<String, dynamic> toJson() => {
        "groupAffiliation": groupAffiliation,
        "relatives": relatives,
      };
}

class Images {
  Images({
    required this.xs,
    required this.sm,
    required this.md,
    required this.lg,
  });

  String xs;
  String sm;
  String md;
  String lg;

  factory Images.fromJson(Map<String, dynamic> json) => Images(
        xs: json["xs"],
        sm: json["sm"],
        md: json["md"],
        lg: json["lg"],
      );

  Map<String, dynamic> toJson() => {
        "xs": xs,
        "sm": sm,
        "md": md,
        "lg": lg,
      };
}

class Powerstats {
  Powerstats({
    required this.intelligence,
    required this.strength,
    required this.speed,
    required this.durability,
    required this.power,
    required this.combat,
  });

  int intelligence;
  int strength;
  int speed;
  int durability;
  int power;
  int combat;

  factory Powerstats.fromJson(Map<String, dynamic> json) => Powerstats(
        intelligence: json["intelligence"],
        strength: json["strength"],
        speed: json["speed"],
        durability: json["durability"],
        power: json["power"],
        combat: json["combat"],
      );

  Map<String, dynamic> toJson() => {
        "intelligence": intelligence,
        "strength": strength,
        "speed": speed,
        "durability": durability,
        "power": power,
        "combat": combat,
      };
}

class Work {
  Work({
    required this.occupation,
    required this.base,
  });

  String occupation;
  String base;

  factory Work.fromJson(Map<String, dynamic> json) => Work(
        occupation: json["occupation"],
        base: json["base"],
      );

  Map<String, dynamic> toJson() => {
        "occupation": occupation,
        "base": base,
      };
}
