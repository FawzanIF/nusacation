import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:nusacation/models/booking_model.dart';
import 'package:nusacation/models/destination_model.dart';
import 'package:nusacation/models/guide_tour_model.dart';
import 'package:nusacation/models/info_model.dart';
import 'package:nusacation/models/models.dart';
import 'package:nusacation/pages/pages.dart';
import 'package:nusacation/shared/shared.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:nusacation/extensions/extensions.dart';
import 'package:http/http.dart' as http;

part 'auth_services.dart';
part 'all_services.dart';

part 'user_services.dart';
