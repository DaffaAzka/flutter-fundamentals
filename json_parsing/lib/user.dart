import 'dart:convert';

class User {
  final num id;
  final String name;
  final String address;
  User({required this.id, required this.name, required this.address});

  User copyWith({num? id, String? name, String? address}) {
    return User(id: id ?? this.id, name: name ?? this.name, address: address ?? this.address);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'id': id, 'name': name, 'address': address};
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(id: map['id'] as num, name: map['name'] as String, address: map['address'] as String);
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'User(id: $id, name: $name, address: $address)';

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name && other.address == address;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ address.hashCode;
}
