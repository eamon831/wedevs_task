class Dimensions {
  final String? length;
  final String? width;
  final String? height;

  Dimensions({
    this.length,
    this.width,
    this.height,
  });

  factory Dimensions.fromJson(Map<String, dynamic> json) => Dimensions(
    length: json['length'],
    width: json['width'],
    height: json['height'],
  );

  Map<String, dynamic> toJson() => {
    'length': length,
    'width': width,
    'height': height,
  };
}
