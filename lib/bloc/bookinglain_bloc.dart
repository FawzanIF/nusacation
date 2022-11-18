import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:nusacation/models/destination_model.dart';
import 'package:nusacation/services/services.dart';

part 'bookinglain_event.dart';
part 'bookinglain_state.dart';

class BookingLainBloc extends Bloc<BookingLainEvent, BookingLainState> {
  BookingLainBloc() : super(BookingLainInitial()) {
    on<BookingLainEvent>(mapEventToState);
  }

  void mapEventToState(
      BookingLainEvent event, Emitter<BookingLainState> emit) async {
    if (event is FetchBookingLain) {
      try {
        List<DestinationModel> bookinglain =
            await DestinationServices().getBookingLain();
        emit(BookingLainLoaded(bookinglain: bookinglain.toList()));
        print(bookinglain);
      } catch (e) {
        print(e);
      }
    } 
  }
}
