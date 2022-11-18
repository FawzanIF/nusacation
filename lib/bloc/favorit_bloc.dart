import 'dart:async';
import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:nusacation/models/destination_model.dart';
import 'package:nusacation/services/services.dart';

part 'favorit_event.dart';
part 'favorit_state.dart';

class FavoritBloc extends Bloc<FavoritEvent, List> {
  FavoritBloc() : super([]);

  List<DestinationModel> _wishlist = [];
  List<DestinationModel> get wishlist => _wishlist;

  bool isWishlist(DestinationModel destination) {
    if (_wishlist.indexWhere((element) => element.id == destination.id) == -1) {
      return false;
    } else {
      return true;
    }
  }

  void setProduct(DestinationModel destination) {
    if (!isWishlist(destination)) {
      _wishlist.add(destination);
    } else {
      _wishlist.removeWhere((element) => element.id == destination.id);
    }
    emit(List.from(_wishlist));
  }

 Future<List<DestinationModel>> fecthDestination() async {
    List<DestinationModel> destinations =
        await DestinationServices().getDestination();

    return destinations;
  }
}
