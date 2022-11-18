part of 'pages.dart';

class Wrapper extends StatefulWidget {
  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    auth.User? firebaseUser = Provider.of<auth.User?>(context);

    if (firebaseUser == null) {
      if (!(prevPageEvent is GoToSplashPage)) {
        prevPageEvent = GoToSplashPage();
        context.read<PageBloc>().add(prevPageEvent!);
      }
    } else {
      if (!(prevPageEvent is GoToMainPage)) {
        context.read<UserBloc>().add(LoadUser(firebaseUser.uid));

        context.read<DestinationBloc>().add(FetchDestinations());

        prevPageEvent = GoToMainPage();
        context.read<PageBloc>().add(prevPageEvent!);
      }
    }

    return BlocBuilder<PageBloc, PageState>(
        builder: (_, pageState) => (pageState is OnSplashPage)
            ? SplashPage()
            : (pageState is OnGetStartedPage)
                ? GetStartedPage()
                : (pageState is OnSignInPage)
                    ? SignInPage()
                    : (pageState is OnRegistrationPage)
                        ? SignUpPage(pageState.registrationData)
                        : (pageState is OnAccountConfirmationPage)
                            ? AccountConfirmationPage(
                                pageState.registrationData)
                            : (pageState is OnDetailDestinationPage)
                                ? DetailDestinationPage(pageState.destination)
                                : (pageState is OnProfilePage)
                                    ? ProfilePage()
                                    : (pageState is OnFavoritPage)
                                        ? FavoritPage()
                                        : (pageState is OnHotelsPage)
                                            ? HotelsPage()
                                            : (pageState
                                                    is OnTransportationPage)
                                                ? TransportaionPage()
                                                : (pageState is OnGuideTourPage)
                                                    ? GuideTourPage()
                                                    : (pageState
                                                            is OnDetailHotelPage)
                                                        ? DetailHotelPage(
                                                            pageState.hotel)
                                                        : (pageState
                                                                is OnDetailPaketPage)
                                                            ? DetailPaketPage(
                                                                pageState.paket)
                                                            : (pageState
                                                                    is OnInfoPage)
                                                                ? InfoPage()
                                                                : (pageState
                                                                        is OnSearchPage)
                                                                    ? SearchPage()
                                                                    : (pageState
                                                                            is OnDetailInfoPage)
                                                                        ? DetailInfoPage(pageState
                                                                            .info)
                                                                        : (pageState
                                                                                is OnEditProfilePage)
                                                                            ? EditProfilePage(pageState.user)
                                                                            : (pageState is OnBookingPage)
                                                                                ? BookingPage(pageState.booking)
                                                                                : (pageState is OnBookingLainPage)
                                                                                    ? BookingLainPage(pageState.bookinglain)
                                                                                    : (pageState is OnDestBookingPage)
                                                                                        ? DestBookingPage(pageState.destBooking)
                                                                                        : (pageState is OnSuccessPage)
                                                                                            ? SuccessPage(pageState.user)
                                                                                            : (pageState is OnTopUpPage)
                                                                                            
                                                                                                ? TopUpPage(pageState.pageEvent)
                                                                                                       : (pageState is OnSuccessTopUpPage)
                                                                                            ? SuccessTopUpPage(pageState.destination,pageState.transaction)
                                                                                                : MainPage());
  }
}
