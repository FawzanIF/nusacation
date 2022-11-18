part of 'bookinglain_bloc.dart';

abstract class BookingLainState extends Equatable {
  const BookingLainState();
}

class BookingLainInitial extends BookingLainState {
    @override
  List<Object> get props => [];
}

class BookingLainLoaded extends BookingLainState {
  final List<DestinationModel>? bookinglain;

  BookingLainLoaded({this.bookinglain});

  @override
  List<Object?> get props => [bookinglain];
}


class BookingLainFailed extends BookingLainState {
  final String error;

  BookingLainFailed(this.error);

  @override
  List<Object> get props => [error];
}

