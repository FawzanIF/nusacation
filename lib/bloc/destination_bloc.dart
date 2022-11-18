import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:nusacation/models/destination_model.dart';
import 'package:nusacation/services/services.dart';

part 'destination_event.dart';
part 'destination_state.dart';

class DestinationBloc extends Bloc<DestinationEvent, DestinationState> {
  DestinationBloc() : super(DestinationInitial()) {
    on<DestinationEvent>(mapEventToState);
  }

  @override
  void mapEventToState(
      DestinationEvent event, Emitter<DestinationState> emit) async {
    if (event is FetchDestinations) {
      try {
        List<DestinationModel> destination =
            await DestinationServices().getDestination();
        emit(DestinationLoaded(destinations: destination.toList()));
        print(destination);
      } catch (e) {
        print(e);
      }
    } 
  }
}
