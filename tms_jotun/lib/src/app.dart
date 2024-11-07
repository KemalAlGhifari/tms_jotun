import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tms_jotun/src/blocs/bloc/user_bloc.dart';
import 'package:tms_jotun/src/pages/home/home.view.dart';
import 'package:tms_jotun/src/pages/login/login.view.dart';
import 'package:tms_jotun/src/pages/onBoarding/onBoardingScreen.view.dart';
import 'package:tms_jotun/src/pages/setting/language.view.dart';
import 'package:tms_jotun/src/pages/splashScreen/splashScreen.view.dart';
import 'package:tms_jotun/src/setting/setting_controller.dart';
import 'package:tms_jotun/src/setting/settings_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tms_jotun/src/utils/helpers.utils.dart';


import 'utils/appLocalizations.utils.dart';

class MyApp extends StatelessWidget {
   MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {    
    return ChangeNotifierProvider(
      create: (_) => SettingsController(SettingsService()),
      child: Consumer<SettingsController>(
        builder: (context, settingsController, child) {
          
          return MultiBlocProvider(
            providers:[
              BlocProvider<UserBloc>(
              create: (context) => UserBloc(),
            ),
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              locale: settingsController.locale,
              supportedLocales: [
                Locale('en', 'US'),
                Locale('id', 'ID'),
                Locale('my', 'MY'),
              ],
              localizationsDelegates: [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              theme: ThemeData(
                fontFamily: 'CustomOutfit',
              ),
              home: HomeScreen(),
            ),
          );
        },
      ),
    );
  }
}
