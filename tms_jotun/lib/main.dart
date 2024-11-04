import 'package:flutter/material.dart';
import 'package:tms_jotun/src/app.dart';
import 'package:tms_jotun/src/setting/setting_controller.dart';
import 'package:tms_jotun/src/setting/settings_service.dart';

void main() async {
  final settingsController = SettingsController(SettingsService());

  // Load the user's preferred theme while the splash screen is displayed.
  // This prevents a sudden theme change when the app is first displayed.
  await settingsController.loadSettings();
  runApp(MyApp(settingsController: settingsController,));
}

