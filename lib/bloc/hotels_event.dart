part of 'hotels_bloc.dart';

abstract class HotelEvent extends Equatable {
  const HotelEvent();
}

class FetchHotels extends HotelEvent {
  @override
  List<Object> get props => [];
}
