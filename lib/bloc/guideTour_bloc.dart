import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:nusacation/models/destination_model.dart';
import 'package:nusacation/models/guide_tour_model.dart';
import 'package:nusacation/services/services.dart';

part 'guideTour_event.dart';
part 'guideTour_state.dart';

class GuideTourBloc extends Bloc<GuideTourEvent, GuideTourState> {
  GuideTourBloc() : super(GuideTourInitial()) {
    on<GuideTourEvent>(mapEventToState);
  }

  @override
  void mapEventToState(
      GuideTourEvent event, Emitter<GuideTourState> emit) async {
    if (event is FetchGuideTour) {
      try {
        List<GuideTourModel> guideTour =
            await DestinationServices().getguideTour();
        emit(GuideTourLoaded(guideTour: guideTour.toList()));
        print(guideTour);
      } catch (e) {
        print(e);
      }
    } 
  }
}
