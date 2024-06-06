class Download {
  final String? id;
  final String? name;
  final String? file;

  Download({
    this.id,
    this.name,
    this.file,
  });

  factory Download.fromJson(Map<String, dynamic> json) => Download(
    id: json['id'],
    name: json['name'],
    file: json['file'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'file': file,
  };
}
