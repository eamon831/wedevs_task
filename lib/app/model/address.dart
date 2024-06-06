class Address {
  final String? street1;
  final String? street2;
  final String? city;
  final String? zip;
  final String? country;
  final String? state;

  Address({
    this.street1,
    this.street2,
    this.city,
    this.zip,
    this.country,
    this.state,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    street1: json['street_1'],
    street2: json['street_2'],
    city: json['city'],
    zip: json['zip'],
    country: json['country'],
    state: json['state'],
  );

  Map<String, dynamic> toJson() => {
    'street_1': street1,
    'street_2': street2,
    'city': city,
    'zip': zip,
    'country': country,
    'state': state,
  };
}
