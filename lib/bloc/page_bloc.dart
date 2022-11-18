import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:nusacation/models/destination_model.dart';
import 'package:nusacation/models/info_model.dart';
import 'package:nusacation/models/models.dart';
import 'package:nusacation/models/nusacation_transaction.dart';
import 'package:nusacation/models/paket_model.dart';

part 'page_event.dart';
part 'page_state.dart';

class PageBloc extends Bloc<PageEvent, PageState> {
  PageBloc()
      : super(
          OnInitialPage(),
        ) {
    on<PageEvent>(mapEventToState);
  }

  @override
  void mapEventToState(PageEvent event, Emitter<PageState> emit) async {
    if (event is GoToSplashPage) {
      emit(OnSplashPage());
    } else if (event is GoToGetStartedPage) {
      emit(OnGetStartedPage());
    } else if (event is GoToSignInPage) {
      emit(OnSignInPage());
    } else if (event is GoToSignUpPage) {
      emit(OnSignUpPage());
    } else if (event is GoToRegistrationPage) {
      emit(OnRegistrationPage(event.registrationData));
    } else if (event is GoToPreferencePage) {
      emit(OnPreferencePage(event.registrationData));
    } else if (event is GoToAccountConfirmationPage) {
      emit(OnAccountConfirmationPage(event.registrationData));
    } else if (event is GoToMainPage) {
      emit(OnMainPage(bottomNavBarIndex: event.bottomNavBarIndex));
    } else if (event is GoToDetailDestinationPage) {
      emit(OnDetailDestinationPage(event.destination));
    } else if (event is GoToDetailHotelPage) {
      emit(OnDetailHotelPage(event.hotel));
    } else if (event is GoToProfilePage) {
      emit(OnProfilePage());
    } else if (event is GoToFavoritPage) {
      emit(OnFavoritPage());
    } else if (event is GoToHotelsPage) {
      emit(OnHotelsPage());
    } else if (event is GoToTranportationPage) {
      emit(OnTransportationPage());
    } else if (event is GoToGuideTourPage) {
      emit(OnGuideTourPage());
    } else if (event is GoToInfoPage) {
      emit(OnInfoPage());
    } else if (event is GoToSearchPage) {
      emit(OnSearchPage());
    } else if (event is GoToDetailInfoPage) {
      emit(OnDetailInfoPage(event.info));
    } else if (event is GoToDetailPaketPage) {
      emit(OnDetailPaketPage(event.paket));
    } else if (event is GoToBookingPage) {
      emit(OnBookingPage(event.booking));
    } else if (event is GoToBookingLainPage) {
      emit(OnBookingLainPage(event.bookinglain));
    } else if (event is GoToDestBookingPage) {
      emit(OnDestBookingPage(event.destBooking));
    } else if (event is GoToSuccessPage) {
      emit(OnSuccessPage(event.user));
    } else if (event is GoToTopUpPage) {
      emit(OnTopUpPage(event.pageEvent));
    } else if (event is GoToSuccessTopUpPage) {
      emit(OnSuccessTopUpPage(event.destination, event.transaction));
    } else if (event is GoToEditProfilePage) {
      emit(OnEditProfilePage(event.user));
    }
  }
}
