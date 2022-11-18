import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:nusacation/models/destination_model.dart';
import 'package:nusacation/services/services.dart';

part 'destbooking_event.dart';
part 'destbooking_state.dart';

class DestBookingBloc extends Bloc<DestBookingEvent, DestBookingState> {
  DestBookingBloc() : super(DestBookingInitial()) {
    on<DestBookingEvent>(mapEventToState);
  }

  void mapEventToState(
      DestBookingEvent event, Emitter<DestBookingState> emit) async {
    if (event is FetchDestBooking) {
      try {
        List<DestinationModel> destBooking =
            await DestinationServices().getDestBooking();
        emit(DestBookingLoaded(destBooking: destBooking.toList()));
        print(destBooking);
      } catch (e) {
        print(e);
      }
    } 
  }
}
