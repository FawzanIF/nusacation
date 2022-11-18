part of 'hotels_bloc.dart';

abstract class HotelState extends Equatable {
  const HotelState();
}

class HotelInitial extends HotelState {
    @override
  List<Object> get props => [];
}

class HotelLoaded extends HotelState {
  final List<DestinationModel>? hotels;

  HotelLoaded({this.hotels});

  @override
  List<Object?> get props => [hotels];
}


class HotelFailed extends HotelState {
  final String error;

  HotelFailed(this.error);

  @override
  List<Object> get props => [error];
}