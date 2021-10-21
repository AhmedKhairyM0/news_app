import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/model/news_model.dart';
import 'package:news_app/modules/business_screen.dart';
import 'package:news_app/modules/science_screen.dart';
import 'package:news_app/modules/sports_screen.dart';
import 'package:news_app/shared/cubit/states.dart';
import 'package:news_app/shared/network/local/cache_helper.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';

String apiKey = '3f6a1b41605d4c85bdda57807398ce30';
String path = 'v2/top-headlines';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(
        icon: Icon(Icons.business_center), label: 'Business'),
    BottomNavigationBarItem(icon: Icon(Icons.science), label: 'Science'),
    BottomNavigationBarItem(icon: Icon(Icons.sports_football), label: 'Sport'),
    // BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
  ];

  List<Widget> screens = [
    BusinessScreen(),
    ScienceScreen(),
    SportScreen(),
    // SettingsScreen(),
  ];

  List<NewsModel> business = [];
  List<NewsModel> science = [];
  List<NewsModel> sport = [];

  void changeBottomItem(index) {
    currentIndex = index;
    emit(NewsBottomNavBarState());

    if (currentIndex == 1 && science.isEmpty) {
      getScienceNews();
    } else if (currentIndex == 2 && sport.isEmpty) {
      getSportNews();
    }
  }

  void getBusinessNews() {
    business = [];
    emit(NewsGetBusniessLoadingState());
    DioHelper.getData(path, {
      'country': 'us',
      'category': 'business',
      'apiKey': apiKey,
    }).then((value) {
      List articles = value.data['articles'];
      for (var article in articles) business.add(NewsModel.fromJson(article));

      emit(NewsGetBusniessSuccessState());
    }).catchError((error) {
      print(error);
      emit(NewsGetBusniessErrorState(error.toString()));
    });
  }

  void getScienceNews() {
    science = [];
    emit(NewsGetScienceLoadingState());
    DioHelper.getData(
            path, {'country': 'us', 'category': 'science', 'apiKey': apiKey})
        .then((value) {
      List articles = value.data['articles'];
      for (var article in articles) science.add(NewsModel.fromJson(article));

      emit(NewsGetScienceSuccessState());
    }).catchError((error) {
      print(error);
      emit(NewsGetScienceErrorState(error.toString()));
    });
  }

  void getSportNews() {
    sport = [];
    emit(NewsGetSportLoadingState());
    DioHelper.getData(
            path, {'country': 'us', 'category': 'sports', 'apiKey': apiKey})
        .then((value) {
      List articles = value.data['articles'];
      for (var article in articles) sport.add(NewsModel.fromJson(article));

      emit(NewsGetSportSuccessState());
    }).catchError((error) {
      print(error);
      emit(NewsGetSportErrorState(error.toString()));
    });
  }

  bool isDark = false;
  void changeAppThemeMode({fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
      print(isDark);
      emit(NewsGetDataFromSharedState());
    } else {
      isDark = !isDark;
      print(isDark);
      CacheHelper.setBoolean(key: 'isDark', value: isDark).then((value) {
        emit(NewsChangeThemeModeState());
      });
    }
  }

  List<NewsModel> search = [];

  void getSearch(String value) {
    search = [];
    DioHelper.getData(
      'v2/everything',
      {
        'q': value,
        'apiKey': apiKey,
      },
    ).then((value) {
      List articles = value.data['articles'];
      for (var article in articles) search.add(NewsModel.fromJson(article));

      emit(NewsSearchAboutSuccessState());
    }).catchError((error) {
      print(error);
      emit(NewsSearchAboutErrorState());
    });
  }
}
