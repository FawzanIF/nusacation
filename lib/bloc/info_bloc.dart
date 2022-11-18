import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:nusacation/models/info_model.dart';
import 'package:nusacation/services/services.dart';

part 'info_event.dart';
part 'info_state.dart';

class InfoBloc extends Bloc<InfoEvent, InfoState> {
  InfoBloc() : super(InfoInitial()) {
    on<InfoEvent>(mapEventToState);
  }

  @override
  void mapEventToState(InfoEvent event, Emitter<InfoState> emit) async {
    if (event is FetchInfo) {
      try {
        List<InfoModel> info = await DestinationServices().getInfo();
        emit(InfoLoaded(info: info.toList()));
        print("plisssssssssssssss ayo ${info}");
      } catch (e) {
        print("plisssssssssssssss ayo ${e}");
      }
    }
  }
}
