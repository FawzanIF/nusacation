part of 'page_bloc.dart';

abstract class PageEvent extends Equatable {
  const PageEvent();
}

class GoToSplashPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToGetStartedPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToLanding extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToStartMenu extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToSignInPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToSignUpPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToRegistrationPage extends PageEvent {
  final RegistrationData registrationData;

  const GoToRegistrationPage(this.registrationData);

  @override
  List<Object> get props => [];
}

class GoToPreferencePage extends PageEvent {
  final RegistrationData registrationData;

  const GoToPreferencePage(this.registrationData);

  @override
  List<Object> get props => [];
}

class GoToAccountConfirmationPage extends PageEvent {
  final RegistrationData registrationData;

  const GoToAccountConfirmationPage(this.registrationData);

  @override
  List<Object> get props => [];
}

class GoToMenuPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToProfilePage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToFavoritPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToMainPage extends PageEvent {
  final int bottomNavBarIndex;

  const GoToMainPage({this.bottomNavBarIndex = 0});

  @override
  List<Object> get props => [bottomNavBarIndex];
}

class GoToHotelsPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToInfoPage extends PageEvent {
  const GoToInfoPage();
  @override
  List<Object> get props => [];
}

class GoToTranportationPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToSuccessPage extends PageEvent {
  final UserModel user;

  const GoToSuccessPage(this.user);
  @override
  List<Object> get props => [];
}

class GoToGuideTourPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToDetailInfoPage extends PageEvent {
  final InfoModel info;

  const GoToDetailInfoPage(this.info);
  @override
  List<Object> get props => [info];
}

class GoToSearchPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToDetailDestinationPage extends PageEvent {
  final DestinationModel destination;

  const GoToDetailDestinationPage(this.destination);

  @override
  List<Object> get props => [destination];
}

class GoToDetailHotelPage extends PageEvent {
  final DestinationModel hotel;

  const GoToDetailHotelPage(this.hotel);

  @override
  List<Object> get props => [hotel];
}

class GoToDetailPaketPage extends PageEvent {
  final DestinationModel paket;

  const GoToDetailPaketPage(this.paket);

  @override
  List<Object> get props => [paket];
}

class GoToBookingPage extends PageEvent {
  final DestinationModel booking;

  const GoToBookingPage(this.booking);

  @override
  List<Object> get props => [booking];
}

class GoToBookingLainPage extends PageEvent {
  final DestinationModel bookinglain;

  const GoToBookingLainPage(this.bookinglain);

  @override
  List<Object> get props => [bookinglain];
}

class GoToDestBookingPage extends PageEvent {
  final DestinationModel destBooking;

  const GoToDestBookingPage(this.destBooking);

  @override
  List<Object> get props => [destBooking];
}

class GoToEditProfilePage extends PageEvent {
  final UserModel user;

  const GoToEditProfilePage(this.user);

  @override
  List<Object> get props => [user];
}

class GoToTopUpPage extends PageEvent {
  final PageEvent pageEvent;

  GoToTopUpPage(this.pageEvent);

  @override
  List<Object> get props => [pageEvent];
}

class GoToSuccessTopUpPage extends PageEvent {
  final DestinationModel? destination;
  final NusacationTransaction? transaction;

  GoToSuccessTopUpPage(this.destination, this.transaction);

  @override
  List<Object> get props => [destination!, transaction!];
}
