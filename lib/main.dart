import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:techblog_app/component/constant/my_colors.dart';
import 'package:techblog_app/view/bindings.dart';
import 'package:techblog_app/view/main_screen/main_screen.dart';
import 'package:techblog_app/view/manage_article.dart';
import 'package:techblog_app/view/single_article.dart';
import 'package:techblog_app/view/single_manage_article.dart';
import 'package:techblog_app/view/splash_screen.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: SolidColors.statusBarColor,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: SolidColors.systemNavigationBarColor,
      systemNavigationBarIconBrightness: Brightness.dark));
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return GetMaterialApp(
        getPages: [
          GetPage(
              name: RouteManager.routeMainScreen,
              page: () => MainScreen(),
              binding: RegisterBinding()),
          GetPage(
              name: RouteManager.routeMainScreen,
              page: () => SingleArticle(),
              binding: ArticleBinding()),
          GetPage(
              name: RouteManager.routeManagerArticle,
              page: () => ManageArticle(),
              binding: ManageArticleBinding()),GetPage(
              name: RouteManager.routeSingleManageArticle,
              page: () => SingleManageArticle(),
              binding: ManageArticleBinding()),
        ],
        theme: lightMode(textTheme),
        locale: const Locale('fa'),
        debugShowCheckedModeBanner: false,
        home: const SplashScreen());
  }

  ThemeData lightMode(TextTheme textTheme) {
    return ThemeData(
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
        ));
  }
}

class RouteManager {
  static String routeMainScreen = '/MainScreen';
  static String routeSingleArticle = '/SingleArticle';
  static String routeManagerArticle = '/ManagerArticle';
  static String routeSingleManageArticle = '/SingleManageArticle';
}
