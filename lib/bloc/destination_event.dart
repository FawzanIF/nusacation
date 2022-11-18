part of 'destination_bloc.dart';

abstract class DestinationEvent extends Equatable {
  const DestinationEvent();
}

class FetchDestinations extends DestinationEvent {
  @override
  List<Object> get props => [];
}


