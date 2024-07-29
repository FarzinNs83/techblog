import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:techblog_app/component/my_colors.dart';
import 'package:techblog_app/view/home_screen.dart';
import 'package:techblog_app/view/main_screen.dart';
import 'package:techblog_app/view/my_categories.dart';
import 'package:techblog_app/view/register_intro.dart';
import 'package:techblog_app/view/splash_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: SolidColors.statusBarColor,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: SolidColors.systemNavigationBarColor,
      systemNavigationBarIconBrightness: Brightness.dark));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return MaterialApp(
      theme: ThemeData(
          inputDecorationTheme: InputDecorationTheme(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(width: 2))),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(textStyle: WidgetStateProperty.resolveWith(
              (states) {
                if (states.contains(WidgetState.pressed)) {
                  return textTheme.displayLarge;
                }
                return textTheme.titleMedium;
              },
            ), backgroundColor: WidgetStateProperty.resolveWith(
              (states) {
                if (states.contains(WidgetState.pressed)) {
                  return Colors.white;
                }
                return SolidColors.primaryColor;
              },
            )),
          ),
          fontFamily: 'dana',
          textTheme: const TextTheme(
            displayLarge: TextStyle(
                fontFamily: 'dana',
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: SolidColors.posterTitle),
            titleSmall: TextStyle(
                fontFamily: 'dana',
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black),
            bodyMedium: TextStyle(
                fontFamily: 'dana',
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: SolidColors.seeMore),
            bodySmall: TextStyle(
                fontFamily: 'dana',
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: Colors.black),
            titleMedium: TextStyle(
                fontFamily: 'dana',
                fontSize: 14,
                fontWeight: FontWeight.w300,
                color: SolidColors.posterSub),
            bodyLarge: TextStyle(
                fontFamily: 'dana', fontSize: 13, fontWeight: FontWeight.w300),
            displayMedium: TextStyle(
                fontFamily: 'dana',
                fontSize: 14,
                color: Colors.black,
                fontWeight: FontWeight.w300),
            displaySmall: TextStyle(
                fontFamily: 'dana',
                fontSize: 14,
                color: Colors.red,
                fontWeight: FontWeight.w700),
            headlineMedium: TextStyle(
                fontFamily: 'dana',
                fontSize: 14,
                color: Colors.green,
                fontWeight: FontWeight.w700),
            labelSmall: TextStyle(
                fontFamily: 'dana',
                fontSize: 14,
                color: SolidColors.hintText,
                fontWeight: FontWeight.w700),
            headlineSmall: TextStyle(
                fontFamily: 'dana',
                fontSize: 14,
                color: SolidColors.primaryColor,
                fontWeight: FontWeight.w700),
          )),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('fa'), // Persian
      ],
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
