class MetaData {
  final int? id;
  final String? key;
  final dynamic value;

  MetaData({
    this.id,
    this.key,
    this.value,
  });

  factory MetaData.fromJson(Map<String, dynamic> json) => MetaData(
    id: json['id'],
    key: json['key'],
    value: json['value'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'key': key,
    'value': value,
  };
}
