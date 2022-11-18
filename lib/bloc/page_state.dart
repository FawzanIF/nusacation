part of 'page_bloc.dart';

abstract class PageState extends Equatable {
  const PageState();
}

class OnInitialPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnGetStartedPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnSignInPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnSignUpPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnSplashPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnLanding extends PageState {
  @override
  List<Object> get props => [];
}

class OnStartMenu extends PageState {
  @override
  List<Object> get props => [];
}

class OnRegistrationPage extends PageState {
  final RegistrationData registrationData;

  const OnRegistrationPage(this.registrationData);

  @override
  List<Object> get props => [];
}

class OnPreferencePage extends PageState {
  final RegistrationData registrationData;

  const OnPreferencePage(this.registrationData);

  @override
  List<Object> get props => [];
}

class OnAccountConfirmationPage extends PageState {
  final RegistrationData registrationData;

  const OnAccountConfirmationPage(this.registrationData);

  @override
  List<Object> get props => [];
}

class OnMenuPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnProfilePage extends PageState {
  @override
  List<Object> get props => [];
}

class OnFavoritPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnHotelsPage extends PageState {
  @override
  List<Object> get props => [];
}
class OnTransportationPage extends PageState {
  @override
  List<Object> get props => [];
}
class OnGuideTourPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnInfoPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnDetailInfoPage extends PageState {
    final InfoModel info;

  const OnDetailInfoPage(this.info);
  @override
  List<Object> get props => [info];
}

class OnSearchPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnSuccessPage extends PageState {
  final UserModel user;
  
  const OnSuccessPage(this.user);
  
  @override
  List<Object> get props => [];
}

class OnDetailDestinationPage extends PageState {
  final DestinationModel destination;

  const OnDetailDestinationPage(this.destination);

  @override
  List<Object> get props => [destination];
}

class OnDetailHotelPage extends PageState {
  final DestinationModel hotel;

  const OnDetailHotelPage(this.hotel);

  @override
  List<Object> get props => [hotel];
}

class OnDetailPaketPage extends PageState {
  final DestinationModel paket;

  const OnDetailPaketPage(this.paket);

  @override
  List<Object> get props => [paket];
}

class OnBookingPage extends PageState {
  final DestinationModel booking;

  const OnBookingPage(this.booking);

  @override
  List<Object> get props => [booking];
}

class OnBookingLainPage extends PageState {
  final DestinationModel bookinglain;

  const OnBookingLainPage(this.bookinglain);

  @override
  List<Object> get props => [bookinglain];
}

class OnDestBookingPage extends PageState {
  final DestinationModel destBooking;

  const OnDestBookingPage(this.destBooking);

  @override
  List<Object> get props => [destBooking];
}

class OnMainPage extends PageState {
  final int bottomNavBarIndex;

  const OnMainPage({this.bottomNavBarIndex = 0});

  @override
  List<Object> get props => [bottomNavBarIndex];
}

class OnEditProfilePage extends PageState {
  final UserModel user;

  const OnEditProfilePage(this.user);

  @override
  List<Object> get props => [user];
}

class OnTopUpPage extends PageState {
  final PageEvent pageEvent;

  OnTopUpPage(this.pageEvent);

  @override
  List<Object> get props => [pageEvent];
}

class OnSuccessTopUpPage extends PageState {
  final DestinationModel? destination;
  final NusacationTransaction? transaction;

  OnSuccessTopUpPage(this.destination, this.transaction);

  @override
  List<Object> get props => [destination!, transaction!];
}
