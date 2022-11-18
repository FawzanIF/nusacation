import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nusacation/bloc/blocs.dart';
import 'package:nusacation/bloc/guideTour_bloc.dart';
import 'package:nusacation/bloc/info_bloc.dart';
import 'package:nusacation/pages/pages.dart';

import 'package:nusacation/services/services.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      initialData: null,
      value: AuthServices.userStream,
      child: MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => PageBloc()),
            BlocProvider(create: (_) => FavoritBloc()),
            BlocProvider(
                create: (_) => DestinationBloc()
                  ..add(
                    FetchDestinations(),
                  )),
            BlocProvider(
                create: (_) => HotelBloc()
                  ..add(
                    FetchHotels(),
                  )),
            BlocProvider(
                create: (_) => TransportationBloc()
                  ..add(
                    FetchTransportation(),
                  )),
            BlocProvider(
                create: (_) => InfoBloc()
                  ..add(
                    FetchInfo(),
                  )),
            BlocProvider(
                create: (_) => GuideTourBloc()
                  ..add(
                    FetchGuideTour(),
                  )),
            BlocProvider(
                create: (_) => PaketBloc()
                  ..add(
                    FetchPaket(),
                  )),
            BlocProvider(create: (_) => UserBloc()),
            BlocProvider(create: (_) => ThemeBloc()),
          ],
          child: BlocBuilder<ThemeBloc, ThemeState>(
              builder: (_, themeState) => MaterialApp(
                  theme: themeState.themeData,
                  debugShowCheckedModeBanner: false,
                  home: Wrapper()))),
    );
  }
}
