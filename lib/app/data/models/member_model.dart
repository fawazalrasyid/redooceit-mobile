class Member {
  final String id;
  final String name;
  final String photoUrl;
  final String phoneNumber;
  final String address;
  final String rt;
  final String rw;
  final int totalStamp;
  final DateTime createdAt;

  Member({
    required this.id,
    required this.name,
    required this.photoUrl,
    required this.phoneNumber,
    required this.address,
    required this.rt,
    required this.rw,
    required this.totalStamp,
    required this.createdAt,
  });

  factory Member.fromJson(Map<String, dynamic> json) {
    return Member(
      id: json['id'] as String,
      name: json['name'] as String,
      photoUrl: json['photo_url'] as String,
      phoneNumber: json['phone_number'] as String,
      address: json['address'] as String,
      rt: json['rt'] as String,
      rw: json['rw'] as String,
      totalStamp: json['total_stamp'] as int,
      createdAt: DateTime.parse(json['created_at'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'photo_url': photoUrl,
      'phone_number': phoneNumber,
      'address': address,
      'rt': rt,
      'rw': rw,
      'total_stamp': totalStamp,
    };
  }
}
