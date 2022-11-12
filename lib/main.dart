import 'package:flutter/material.dart';
import 'core/services/service_locator.dart';
import 'weather/presentation/screens/home_screen.dart';
import 'core/global/theme_data/light.dart';
import 'core/utils/app_constants.dart';
import 'core/utils/import_files.dart';

void main() async {
  ServiceLocator.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 851),
      minTextAdapt: false,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: AppConstants.appTitle,
          theme: getThemeDataLight,
          home: const HomeScreen(),
          builder: (context, child) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
              child: child!,
            );
          },
        );
      },
    );
  }
}
