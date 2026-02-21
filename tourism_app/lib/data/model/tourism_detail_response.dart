// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:navigation_app/data/model/tourism.dart';

class TourismDetailResponse {
  bool error;
  String message;
  Tourism place;
  TourismDetailResponse({required this.error, required this.message, required this.place});

  TourismDetailResponse copyWith({bool? error, String? message, Tourism? place}) {
    return TourismDetailResponse(
      error: error ?? this.error,
      message: message ?? this.message,
      place: place ?? this.place,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'error': error, 'message': message, 'place': place.toMap()};
  }

  factory TourismDetailResponse.fromMap(Map<String, dynamic> map) {
    return TourismDetailResponse(
      error: map['error'] as bool,
      message: map['message'] as String,
      place: Tourism.fromMap(map['place'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory TourismDetailResponse.fromJson(String source) =>
      TourismDetailResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'TourismDetailResponse(error: $error, message: $message, place: $place)';

  @override
  bool operator ==(covariant TourismDetailResponse other) {
    if (identical(this, other)) return true;

    return other.error == error && other.message == message && other.place == place;
  }

  @override
  int get hashCode => error.hashCode ^ message.hashCode ^ place.hashCode;
}
