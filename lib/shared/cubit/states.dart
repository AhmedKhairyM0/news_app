abstract class NewsStates {}

class NewsInitialState extends NewsStates {}

class NewsBottomNavBarState extends NewsStates {}

class NewsGetBusniessLoadingState extends NewsStates {}

class NewsGetBusniessSuccessState extends NewsStates {}

class NewsGetBusniessErrorState extends NewsStates {
  final String error;
  NewsGetBusniessErrorState(this.error);
}

class NewsGetScienceLoadingState extends NewsStates {}

class NewsGetScienceSuccessState extends NewsStates {}

class NewsGetScienceErrorState extends NewsStates {
  final String error;
  NewsGetScienceErrorState(this.error);
}

class NewsGetSportLoadingState extends NewsStates {}

class NewsGetSportSuccessState extends NewsStates {}

class NewsGetSportErrorState extends NewsStates {
  final String error;
  NewsGetSportErrorState(this.error);
}

class NewsChangeThemeModeState extends NewsStates {}

class NewsGetDataFromSharedState extends NewsStates {}

class NewsSearchAboutSuccessState extends NewsStates {}

class NewsSearchAboutErrorState extends NewsStates {}
