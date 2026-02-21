import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:navigation_app/data/model/tourism.dart';

class TourismListResponse {
  bool error;
  String message;
  num count;
  List<Tourism> places;

  TourismListResponse({required this.error, required this.message, required this.count, required this.places});

  TourismListResponse copyWith({bool? error, String? message, num? count, List<Tourism>? places}) {
    return TourismListResponse(
      error: error ?? this.error,
      message: message ?? this.message,
      count: count ?? this.count,
      places: places ?? this.places,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'error': error,
      'message': message,
      'count': count,
      'places': places.map((x) => x.toMap()).toList(),
    };
  }

  factory TourismListResponse.fromMap(Map<String, dynamic> map) {
    return TourismListResponse(
      error: map['error'] as bool,
      message: map['message'] as String,
      count: map['count'] as num,
      places: List<Tourism>.from(
        (map['places'] as List<dynamic>).map<Tourism>((x) => Tourism.fromMap(x as Map<String, dynamic>)),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory TourismListResponse.fromJson(String source) =>
      TourismListResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TourismListResponse(error: $error, message: $message, count: $count, places: $places)';
  }

  @override
  bool operator ==(covariant TourismListResponse other) {
    if (identical(this, other)) return true;

    return other.error == error && other.message == message && other.count == count && listEquals(other.places, places);
  }

  @override
  int get hashCode {
    return error.hashCode ^ message.hashCode ^ count.hashCode ^ places.hashCode;
  }
}
