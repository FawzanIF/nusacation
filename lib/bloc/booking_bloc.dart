import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:nusacation/models/destination_model.dart';
import 'package:nusacation/services/services.dart';

part 'booking_event.dart';
part 'booking_state.dart';

class BookingBloc extends Bloc<BookingEvent, BookingState> {
  BookingBloc() : super(BookingInitial()) {
    on<BookingEvent>(mapEventToState);
  }

  void mapEventToState(
      BookingEvent event, Emitter<BookingState> emit) async {
    if (event is FetchBooking) {
      try {
        List<DestinationModel> booking =
            await DestinationServices().getBooking();
        emit(BookingLoaded(booking: booking.toList()));
        print(booking);
      } catch (e) {
        print(e);
      }
    } 
  }
}
