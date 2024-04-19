class Crypto {
  final String name;
  final double currentPrice;
  final String image;

  Crypto({
    required this.name,
    required this.currentPrice,
    required this.image,
  });

  factory Crypto.fromJson(Map<String, dynamic> json) {
    return Crypto(
      name: json['name'],
      currentPrice: (json['current_price'] is int)
          ? (json['current_price'] as int).toDouble()
          : json['current_price'],
      image: json['image'],
    );
  }
}
