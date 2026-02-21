import 'dart:convert';

class Tourism {
  num id;
  String name;
  String address;
  String description;
  num longitude;
  num latitude;
  num like;
  String image;
  Tourism({
    required this.id,
    required this.name,
    required this.address,
    required this.description,
    required this.longitude,
    required this.latitude,
    required this.like,
    required this.image,
  });

  

  Tourism copyWith({
    num? id,
    String? name,
    String? address,
    String? description,
    num? longitude,
    num? latitude,
    num? like,
    String? image,
  }) {
    return Tourism(
      id: id ?? this.id,
      name: name ?? this.name,
      address: address ?? this.address,
      description: description ?? this.description,
      longitude: longitude ?? this.longitude,
      latitude: latitude ?? this.latitude,
      like: like ?? this.like,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'address': address,
      'description': description,
      'longitude': longitude,
      'latitude': latitude,
      'like': like,
      'image': image,
    };
  }

  factory Tourism.fromMap(Map<String, dynamic> map) {
    return Tourism(
      id: map['id'] as num,
      name: map['name'] as String,
      address: map['address'] as String,
      description: map['description'] as String,
      longitude: map['longitude'] as num,
      latitude: map['latitude'] as num,
      like: map['like'] as num,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Tourism.fromJson(String source) => Tourism.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Tourism(id: $id, name: $name, address: $address, description: $description, longitude: $longitude, latitude: $latitude, like: $like, image: $image)';
  }

  @override
  bool operator ==(covariant Tourism other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.address == address &&
      other.description == description &&
      other.longitude == longitude &&
      other.latitude == latitude &&
      other.like == like &&
      other.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      address.hashCode ^
      description.hashCode ^
      longitude.hashCode ^
      latitude.hashCode ^
      like.hashCode ^
      image.hashCode;
  }
}
