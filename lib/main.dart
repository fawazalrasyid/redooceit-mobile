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
    name: 'RedooceIt',
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await initializeDateFormatting();
  Intl.defaultLocale = 'id';
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(
    StatusbarzCapturer(
      child: GetMaterialApp(
        navigatorObservers: [Statusbarz.instance.observer],
        debugShowCheckedModeBanner: false,
        title: "RedooceIt",
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
        theme: ThemeData(
          brightness: Brightness.light,
          scaffoldBackgroundColor: AppColors.pageBackground,
          primarySwatch: AppColors.colorPrimarySwatch,
          primaryColor: AppColors.colorPrimary,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          appBarTheme: const AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarBrightness: Brightness.dark,
              statusBarIconBrightness: Brightness.dark,
            ),
          ),
        ),
      ),
    ),
  );
}
