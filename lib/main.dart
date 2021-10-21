import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/modules/modules.dart';
import 'package:news_app/shared/component/constant.dart';
import 'package:news_app/shared/cubit/cubit_observer.dart';
import 'package:news_app/shared/network/local/cache_helper.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';

import 'layout/news_app/news_layout.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  DioHelper.init();
  Bloc.observer = MyBlocObserver();

  await CacheHelper.init();
  var isDarkFromShared = CacheHelper.getBoolean(key: 'isDark');
  
  runApp(MyApp(isDark: isDarkFromShared));
}

class MyApp extends StatelessWidget {
  final bool? isDark;
  MyApp({this.isDark});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit()
        ..changeAppThemeMode(fromShared: isDark)
        ..getBusinessNews(),
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            title: 'News App',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: AppBarTheme(
                iconTheme: IconThemeData(
                  color: Colors.black,
                ),
                backwardsCompatibility: false,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.white,
                  statusBarIconBrightness: Brightness.dark,
                ),
                backgroundColor: Colors.white,
                elevation: 0.0,
                titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                selectedItemColor: Colors.deepOrange,
                type: BottomNavigationBarType.fixed,
              ),
              textTheme: TextTheme(
                bodyText1: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ),
            darkTheme: ThemeData(
              scaffoldBackgroundColor: kPrimaryColorDark,
              appBarTheme: AppBarTheme(
                iconTheme: IconThemeData(
                  color: Colors.white,
                ),
                backwardsCompatibility: false,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: kPrimaryColorDark,
                  statusBarIconBrightness: Brightness.light,
                ),
                backgroundColor: kPrimaryColorDark,
                elevation: 0.0,
                titleTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                selectedItemColor: Colors.deepOrange,
                type: BottomNavigationBarType.fixed,
                unselectedItemColor: Colors.grey[600],
                backgroundColor: kPrimaryColorDark,
              ),
              textTheme: TextTheme(
                bodyText1: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ),
            themeMode: NewsCubit.get(context).isDark
                ? ThemeMode.dark
                : ThemeMode.light,
            home: Directionality(
              textDirection: TextDirection.ltr,
              child: NewsHome(),
            ),
          );
        },
      ),
    );
  }
}

// SystemChrome.setEnabledSystemUIOverlays([]);
