import 'address.dart';

class Store {
  final int? id;
  final String? name;
  final String? url;
  final String? avatar;
  final Address? address;

  Store({
    this.id,
    this.name,
    this.url,
    this.avatar,
    this.address,
  });

  factory Store.fromJson(Map<String, dynamic> json) => Store(
    id: json['id'],
    name: json['name'],
    url: json['url'],
    avatar: json['avatar'],
    address:
    json['address'] == null ? null : Address.fromJson(json['address']),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'url': url,
    'avatar': avatar,
    'address': address?.toJson(),
  };
}
