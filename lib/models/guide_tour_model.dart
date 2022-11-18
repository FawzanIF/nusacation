import 'package:equatable/equatable.dart';

class GuideTourModel extends Equatable {
  final String? name;
  final String? imageUrl;
  final double? rating;
  final String? walink;

  const GuideTourModel(
      {required this.name,
      required this.imageUrl,
      required this.rating,
      required this.walink});

  factory GuideTourModel.fromJson(Map<String, dynamic> json) {
    return GuideTourModel(
      name: json['name'] ?? "",
      imageUrl: json['imageUrl'],
      rating: json['rating'].toDouble(),
      walink: json["walink"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'imageUrl': imageUrl,
      'rating': rating,
      'walink': walink,
    };
  }

  @override
  List<Object?> get props => [name, imageUrl, rating, walink];
}
