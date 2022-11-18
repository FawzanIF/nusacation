import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:nusacation/models/destination_model.dart';
import 'package:nusacation/services/services.dart';

part 'transportation_event.dart';
part 'transportation_state.dart';

class TransportationBloc extends Bloc<TransportationEvent, TransportationState> {
  TransportationBloc() : super(TransportationInitial()) {
    on<TransportationEvent>(mapEventToState);
  }

  @override
  void mapEventToState(
      TransportationEvent event, Emitter<TransportationState> emit) async {
    if (event is FetchTransportation) {
      try {
        List<DestinationModel> transportation =
            await DestinationServices().getTransportation();
        emit(TransportationLoaded(transportation: transportation.toList()));
        print(transportation);
      } catch (e) {
        print(e);
      }
    } 
  }
}
