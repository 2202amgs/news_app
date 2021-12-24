import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_news/shared/cubits/app_cubit/cubit.dart';
import 'package:flutter_app_news/shared/cubits/app_cubit/states.dart';
import 'package:flutter_app_news/shared/network/local/cache_helper.dart';
import 'package:flutter_app_news/shared/network/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'layout/news_layout.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
  bool? isDark = CacheHelper.getBoolean(key: 'isDark');
  runApp(MyApp(isDark: isDark));
}

class MyApp extends StatelessWidget {
  final bool? isDark;
  const MyApp({Key? key, required this.isDark}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..toggleThemeMode(sharedThemeMode: isDark),
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
              primarySwatch: Colors.red,
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                // elevation: 15.0,
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.white,
                // selectedItemColor: Colors.deepOrange,
              ),
              appBarTheme: const AppBarTheme(
                titleSpacing: 20.0,

                // backwardsCompatibility: false,
                backgroundColor: Colors.white,
                elevation: 0.0,
                titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
                actionsIconTheme: IconThemeData(
                  color: Colors.black,
                ),
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.white,
                  statusBarIconBrightness: Brightness.dark,
                ),
              ),
              textTheme: const TextTheme(
                bodyText1: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
            ),
            darkTheme: ThemeData(
              primarySwatch: Colors.red,
              primaryColor: Colors.white,
              scaffoldBackgroundColor: Colors.black12,
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                backgroundColor: Colors.black12,
                type: BottomNavigationBarType.fixed,
                unselectedItemColor: Colors.white,
                elevation: 20.0,
              ),
              appBarTheme: const AppBarTheme(
                titleSpacing: 20.0,
                backgroundColor: Colors.black26,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.black12,
                  statusBarIconBrightness: Brightness.light,
                ),
              ),
              textTheme: const TextTheme(
                bodyText1: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
              inputDecorationTheme: const InputDecorationTheme(
                iconColor: Colors.white,
                focusColor: Colors.white,
                hoverColor: Colors.white,
                fillColor: Colors.white,
                suffixIconColor: Colors.white,
                prefixIconColor: Colors.white,
                hintStyle: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            themeMode: AppCubit.get(context).themeMode
                ? ThemeMode.light
                : ThemeMode.dark,
            home: const NewsLayout(),
          );
        },
      ),
    );
  }
}
