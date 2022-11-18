part of 'destination_bloc.dart';

abstract class DestinationState extends Equatable {
  const DestinationState();
}

class DestinationInitial extends DestinationState {
    @override
  List<Object> get props => [];
}

class DestinationLoaded extends DestinationState {
  final List<DestinationModel>? destinations;

  DestinationLoaded({this.destinations});

  @override
  List<Object?> get props => [destinations];
}


class DestinationFailed extends DestinationState {
  final String error;

  DestinationFailed(this.error);

  @override
  List<Object> get props => [error];
}

