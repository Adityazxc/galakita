import 'dart:convert';



class Package {
  List<Datum> data;

  Package({
    required this.data,
  });

  factory Package.fromJson(Map<String, dynamic> json) => Package(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Topping {
  int id;
  int packageId;
  int toppingId;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  Datum topping;

  Topping({
    required this.id,
    required this.packageId,
    required this.toppingId,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.topping,
  });

  factory Topping.fromJson(Map<String, dynamic> json) => Topping(
    id: json["id"],
    packageId: json["packageId"],
    toppingId: json["toppingId"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    deletedAt: json["deletedAt"],
    topping: Datum.fromJson(json["topping"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "packageId": packageId,
    "toppingId": toppingId,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "deletedAt": deletedAt,
    "topping": topping.toJson(),
  };
}

class Datum {
  int id;
  String name;
  int price;
  bool isActive;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  List<Topping> toppings;
  int value;
  String tag;

  Datum({
    required this.id,
    required this.name,
    required this.price,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.toppings,
    required this.value,
    required this.tag,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    price: json["price"],
    isActive: json["isActive"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    deletedAt: json["deletedAt"],
    toppings: List<Topping>.from(json["toppings"].map((x) => Topping.fromJson(x))),
    value: json["value"],
    tag: json["tag"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "price": price,
    "isActive": isActive,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "deletedAt": deletedAt,
    "toppings": List<dynamic>.from(toppings.map((x) => x.toJson())),
    "value": value,
    "tag": tag,
  };
}
