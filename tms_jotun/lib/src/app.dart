import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:tms_jotun/src/pages/home/home.view.dart';
import 'package:tms_jotun/src/setting/setting_controller.dart';
import 'package:tms_jotun/src/utils/appLocalizations.utils.dart';
import 'package:tms_jotun/src/utils/colorManager.utils.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  MyApp({
    super.key,
    required this.settingsController,
  });

  final SettingsController settingsController;

  final textStyle = const TextStyle(
    fontFamily: "CustomOutfit",
  );

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: settingsController,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          navigatorKey: navigatorKey,
          locale: Locale('en'), 
          supportedLocales: [
            Locale('en', 'US'),
            Locale('id', 'ID'),
          ],
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          restorationScopeId: 'app',
          theme: ThemeData(
            fontFamily: 'CustomOLatoutfit',
            textTheme: TextTheme(
              bodyLarge: TextStyle(
                  fontFamily: "Lato", color: ColorManager.textBlack),
              bodyMedium: TextStyle(
                  fontFamily: "Lato", color: ColorManager.textBlack),
              bodySmall: TextStyle(
                  fontFamily: "Lato", color: ColorManager.textBlack),
            ),
          ),
          darkTheme: ThemeData.light(),
          themeMode: settingsController.themeMode,
          home: HomeScreen(),
        );

      },
    );
  }
}
