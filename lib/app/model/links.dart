import 'collection.dart';

class Links {
  final List<Collection>? self;
  final List<Collection>? collection;

  Links({
    this.self,
    this.collection,
  });

  factory Links.fromJson(Map<String, dynamic> json) => Links(
    self: json['self'] == null
        ? []
        : List<Collection>.from(
        json['self']!.map((x) => Collection.fromJson(x)),),
    collection: json['collection'] == null
        ? []
        : List<Collection>.from(
        json['collection']!.map((x) => Collection.fromJson(x)),),
  );

  Map<String, dynamic> toJson() => {
    'self': self == null
        ? []
        : List<dynamic>.from(self!.map((x) => x.toJson())),
    'collection': collection == null
        ? []
        : List<dynamic>.from(collection!.map((x) => x.toJson())),
  };
}
