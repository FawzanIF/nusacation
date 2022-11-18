import 'package:equatable/equatable.dart';

class PaketModel extends Equatable {
  final String? id;
  final String? name;
  final String? imageUrl;
  final List? deskripsi;

  final String? city;
  final String? location;
  final double? rating;
  final int? price;

  PaketModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.city,
    required this.location,
    required this.deskripsi,
    this.rating = 0.0,
    this.price = 0,
  });

  factory PaketModel.fromJson(Map<String, dynamic> json) {
    return PaketModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? "",
      imageUrl: json['imageUrl'],
      city: json['city'],
      location: json['location'],
      deskripsi: json['deskripsi'],
      rating: json['rating'].toDouble(),
      price: json["price"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
      'city': city,
      'location': location,
      'rating': rating,
      'price': price,
      'deskripsi': deskripsi
    };
  }

  @override
  List<Object?> get props =>
      [id, name, imageUrl, city, location, deskripsi, rating, price];
}
