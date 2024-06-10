import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:redooceit/firebase_options.dart';
import 'package:statusbarz/statusbarz.dart';

import 'app/core/values/app_colors.dart';
import 'app/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await initializeDateFormatting();
  Intl.defaultLocale = 'id';
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}
