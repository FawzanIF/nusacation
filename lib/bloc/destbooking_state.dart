part of 'destbooking_bloc.dart';

abstract class DestBookingState extends Equatable {
  const DestBookingState();
}

class DestBookingInitial extends DestBookingState {
    @override
  List<Object> get props => [];
}

class DestBookingLoaded extends DestBookingState {
  final List<DestinationModel>? destBooking;

  DestBookingLoaded({this.destBooking});

  @override
  List<Object?> get props => [destBooking];
}


class DestBookingFailed extends DestBookingState {
  final String error;

  DestBookingFailed(this.error);

  @override
  List<Object> get props => [error];
}

