part of 'guideTour_bloc.dart';

abstract class GuideTourState extends Equatable {
  const GuideTourState();
}

class GuideTourInitial extends GuideTourState {
    @override
  List<Object> get props => [];
}

class GuideTourLoaded extends GuideTourState {
  final List<GuideTourModel>? guideTour;

  GuideTourLoaded({this.guideTour});

  @override
  List<Object?> get props => [guideTour];
}


class  GuideTourFailed extends GuideTourState {
  final String error;

   GuideTourFailed(this.error);

  @override
  List<Object> get props => [error];
}

