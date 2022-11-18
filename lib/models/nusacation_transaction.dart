import 'package:equatable/equatable.dart';

class NusacationTransaction extends Equatable {
  final String userID;
  final String title;
  final String subtitle;
  final int amount;
  final DateTime time;
  final String? picture;

  NusacationTransaction(
      {required this.userID,
      required this.title,
      required this.subtitle,
      this.amount = 0,
      required this.time,
      this.picture});

  @override
  List<Object> get props => [userID, title, subtitle, amount, time, picture!];
}
