import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:nusacation/models/destination_model.dart';
import 'package:nusacation/services/services.dart';

part 'paket_event.dart';
part 'paket_state.dart';

class PaketBloc extends Bloc<PaketEvent, PaketState> {
  PaketBloc() : super(PaketInitial()) {
    on<PaketEvent>(mapEventToState);
  }

  @override
  void mapEventToState(
      PaketEvent event, Emitter<PaketState> emit) async {
    if (event is FetchPaket) {
      try {
        List<DestinationModel> paket =
            await DestinationServices().getPaket();
        emit(PaketLoaded(paket: paket.toList()));
        print(paket);
      } catch (e) {
        print(e);
      }
    } 
  }
}
