import 'package:equatable/equatable.dart';

class InfoModel extends Equatable {
  final String? id;
  final String? title;
  final String? deskripsi;
  final String? imageUrl;


  final String? creatorImage;
  final String? creatorName;
  final String? time;

   InfoModel(
      {required this.id,
      required this.imageUrl,
      required this.title,
      required this.deskripsi,
      required this.creatorImage,
      required this.creatorName,
      required this.time});

  factory InfoModel.fromJson(Map<String, dynamic> json) {
    return InfoModel(
      id: json['id'] ?? "",
      title: json['title'],
      deskripsi: json['deskripsi'],
      creatorImage: json["creatorImage"],
      creatorName: json['creatorName'],
      time: json["time"],
      imageUrl: json["imageUrl"],

    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'deskripsi': deskripsi,
      'creatorImage': creatorImage,
      'creatorName': creatorName,
      'time': time,
      'imageUrl': imageUrl,

    };
  }

  @override
  List<Object?> get props =>
      [id,imageUrl, title, deskripsi, creatorImage, creatorName, time];
}
