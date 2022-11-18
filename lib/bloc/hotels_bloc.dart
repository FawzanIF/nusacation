import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:nusacation/models/destination_model.dart';
import 'package:nusacation/services/services.dart';

part 'hotels_event.dart';
part 'hotels_state.dart';

class HotelBloc extends Bloc<HotelEvent, HotelState> {
  HotelBloc() : super(HotelInitial()) {
    on<HotelEvent>(mapEventToState);
  }

  @override
  void mapEventToState(
      HotelEvent event, Emitter<HotelState> emit) async {
 if (event is FetchHotels) {
      try {
        List<DestinationModel> hotel = await DestinationServices().getHotels();
        emit(HotelLoaded(hotels: hotel.toList()));
        print(hotel);
      } catch (e) {
        print(e);
      }
    }
  }
}
