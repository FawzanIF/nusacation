part of 'destbooking_bloc.dart';

abstract class DestBookingEvent extends Equatable {
  const DestBookingEvent();
}

class FetchDestBooking extends DestBookingEvent {
  @override
  List<Object> get props => [];
}


