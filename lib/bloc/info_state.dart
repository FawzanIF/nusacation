part of 'info_bloc.dart';

abstract class InfoState extends Equatable {
  const InfoState();
}

class InfoInitial extends InfoState {
    @override
  List<Object> get props => [];
}

class InfoLoaded extends InfoState {
  final List<InfoModel>? info;

  InfoLoaded({this.info});

  @override
  List<Object?> get props => [info];
}


class  InfoFailed extends InfoState {
  final String error;

   InfoFailed(this.error);

  @override
  List<Object> get props => [error];
}

