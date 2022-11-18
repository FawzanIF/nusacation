part of 'paket_bloc.dart';

abstract class PaketState extends Equatable {
  const PaketState();
}

class PaketInitial extends PaketState {
    @override
  List<Object> get props => [];
}

class PaketLoaded extends PaketState {
  final List<DestinationModel>? paket;

  PaketLoaded({this.paket});

  @override
  List<Object?> get props => [paket];
}


class PaketFailed extends PaketState {
  final String error;

  PaketFailed(this.error);

  @override
  List<Object> get props => [error];
}

