import 'dart:async';
import 'dart:io';
import 'dart:math' as math;

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:ticket_widget/ticket_widget.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:nusacation/bloc/blocs.dart';
import 'package:nusacation/bloc/guideTour_bloc.dart';
import 'package:nusacation/models/destination_model.dart';
import 'package:nusacation/models/guide_tour_model.dart';
import 'package:nusacation/models/info_model.dart';
import 'package:nusacation/models/nusacation_transaction.dart';
import 'package:nusacation/models/paket_model.dart';
import 'package:nusacation/pages/list_destination.dart';
import 'package:nusacation/services/services.dart';
import 'package:nusacation/shared/shared.dart';
import 'package:nusacation/widgets/booking_details.dart';
import 'package:nusacation/widgets/destination_card.dart';
import 'package:nusacation/widgets/facility_item.dart';
import 'package:nusacation/widgets/favorit_destination_card.dart';
import 'package:nusacation/widgets/guide_tour.dart';
import 'package:nusacation/widgets/information_card.dart';
import 'package:nusacation/widgets/loading_shimmer.dart';
import 'package:nusacation/widgets/money_card.dart';
import 'package:nusacation/widgets/popular_spot.dart';
import 'package:nusacation/extensions/extensions.dart';



import 'package:syncfusion_flutter_gauges/gauges.dart';

import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

import 'package:provider/provider.dart';


import 'package:path/path.dart';
import 'package:flutter/services.dart';

import 'package:provider/provider.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:nusacation/models/models.dart';
import 'package:url_launcher/url_launcher.dart';

part 'get_started_page.dart';
part 'splash_page.dart';
part 'account_confirmation_page.dart';

part 'sign_in_page.dart';
part 'sign_up_page.dart';
part 'search_page.dart';
part 'topup_page.dart';

part 'success_topup_page.dart';



part 'menu_page.dart';
part 'main_page.dart';
part 'hotels_page.dart';
part 'transportation_page.dart';
part 'guide_tour_page.dart';
part 'booking_page.dart';


part 'detail_page_nonpaket.dart';
part 'detail_page_hotel.dart';
part 'detail_page_paket.dart';


part 'detail_info_page.dart';



part 'edit_profile.dart';
part 'info_page.dart';

part 'profile_page.dart';
part 'favorit_page.dart';
part 'ticket_page.dart';
part 'wrapper.dart';
part 'success_page.dart';
part 'destbooking_page.dart';
part 'bookinglain_page.dart';
part 'destination_ticket.dart';
part 'tiket_paket.dart';
part 'tiket_akomodasi.dart';