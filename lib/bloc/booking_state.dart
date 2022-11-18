part of 'booking_bloc.dart';

abstract class BookingState extends Equatable {
  const BookingState();
}

class BookingInitial extends BookingState {
    @override
  List<Object> get props => [];
}

class BookingLoaded extends BookingState {
  final List<DestinationModel>? booking;

  BookingLoaded({this.booking});

  @override
  List<Object?> get props => [booking];
}


class BookingFailed extends BookingState {
  final String error;

  BookingFailed(this.error);

  @override
  List<Object> get props => [error];
}

