class TPS {
  final String id;
  final String name;
  final String address;

  TPS({
    required this.id,
    required this.name,
    required this.address,
  });

  factory TPS.fromJson(Map<String, dynamic> json) {
    return TPS(
      id: json['id'] as String,
      name: json['name'] as String,
      address: json['address'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'address': address,
    };
  }
}
