import 'dart:async';
import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:nusacation/models/models.dart';
import 'package:nusacation/services/services.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc()
      : super(
          UserInitial(),
        ) {
    on<UserEvent>(mapEventToState);
    // on<UpdateData>((event, emit) async {
    //   UserModel updatedUserr = (state as UserLoaded).user.copyWith();
    //   UserModel updatedUser = (state as UserLoaded)
    //       .user
    //       .copyWith(name: event.name, profilePicture: event.profileImage);

    //   await UserServices.updateUser(updatedUser);

    //   emit(UserLoaded(updatedUserr));
    // });
  }

  void mapEventToState(event, emit) async {
    if (event is LoadUser) {
      UserModel user = await UserServices.getUser(event.id);

      emit(UserLoaded(user));
    } else if (event is SignOut) {
      emit(UserInitial());
    } else if (event is UpdateData) {
      UserModel updatedUser = (state as UserLoaded)
          .user
          .copyWith(name: event.name, profilePicture: event.profileImage);

      await UserServices.updateUser(updatedUser);

      emit (UserLoaded(updatedUser));
    }else if (event is TopUp) {
      if (state is UserLoaded) {
        try {
          UserModel updatedUser = (state as UserLoaded).user.copyWith(
              balance: (state as UserLoaded).user.balance! + event.amount);

          await UserServices.updateUser(updatedUser);

          emit(UserLoaded(updatedUser));
        } catch (e) {
          print(e);
        }
      }
    }
  }
}
