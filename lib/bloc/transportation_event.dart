part of 'transportation_bloc.dart';

abstract class TransportationEvent extends Equatable {
  const TransportationEvent();
}

class FetchTransportation extends TransportationEvent {
  @override
  List<Object> get props => [];
}


