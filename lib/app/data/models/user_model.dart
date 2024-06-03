class RUser {
  final String id;
  final String name;
  final String email;
  final String image;
  final String tpsId;

  RUser({
    required this.id,
    required this.name,
    required this.email,
    required this.image,
    required this.tpsId,
  });

  factory RUser.fromJson(Map<String, dynamic> json) {
    return RUser(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      image: json['image'] as String,
      tpsId: json['tps_id'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'image': image,
      'tps_id': tpsId,
    };
  }
}
