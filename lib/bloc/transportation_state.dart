part of 'transportation_bloc.dart';

abstract class TransportationState extends Equatable {
  const TransportationState();
}

class TransportationInitial extends TransportationState {
    @override
  List<Object> get props => [];
}

class TransportationLoaded extends TransportationState {
  final List<DestinationModel>? transportation;

  TransportationLoaded({this.transportation});

  @override
  List<Object?> get props => [transportation];
}


class TransportationFailed extends TransportationState {
  final String error;

  TransportationFailed(this.error);

  @override
  List<Object> get props => [error];
}

