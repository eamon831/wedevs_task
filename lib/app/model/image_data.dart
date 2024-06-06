class ImageData {
  final int? id;
  final DateTime? dateCreated;
  final DateTime? dateCreatedGmt;
  final DateTime? dateModified;
  final DateTime? dateModifiedGmt;
  final String? src;
  final String? name;
  final String? alt;
  final int? position;

  ImageData({
    this.id,
    this.dateCreated,
    this.dateCreatedGmt,
    this.dateModified,
    this.dateModifiedGmt,
    this.src,
    this.name,
    this.alt,
    this.position,
  });

  factory ImageData.fromJson(Map<String, dynamic> json) => ImageData(
    id: json['id'],
    dateCreated: json['date_created'] == null
        ? null
        : DateTime.parse(json['date_created']),
    dateCreatedGmt: json['date_created_gmt'] == null
        ? null
        : DateTime.parse(json['date_created_gmt']),
    dateModified: json['date_modified'] == null
        ? null
        : DateTime.parse(json['date_modified']),
    dateModifiedGmt: json['date_modified_gmt'] == null
        ? null
        : DateTime.parse(json['date_modified_gmt']),
    src: json['src'],
    name: json['name'],
    alt: json['alt'],
    position: json['position'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'date_created': dateCreated?.toIso8601String(),
    'date_created_gmt': dateCreatedGmt?.toIso8601String(),
    'date_modified': dateModified?.toIso8601String(),
    'date_modified_gmt': dateModifiedGmt?.toIso8601String(),
    'src': src,
    'name': name,
    'alt': alt,
    'position': position,
  };
}
