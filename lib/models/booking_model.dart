import 'package:equatable/equatable.dart';

class BookingModel extends Equatable {
  final String? id;
  final String? name;
  final String? imageUrl;
  final String? location;
  final int? price;

  BookingModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.location,
    this.price = 0,
  });

  factory BookingModel.fromJson(Map<String, dynamic> json) {
    return BookingModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? "",
      imageUrl: json['imageUrl'],
      location: json['location'],
      price: json["price"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
      'location': location,
      'price': price,
    };
  }

  @override
  List<Object?> get props =>
      [id, name, imageUrl, location, price];
}
