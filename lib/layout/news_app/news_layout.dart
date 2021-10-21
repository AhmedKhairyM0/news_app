import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/modules/search_screen.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';
import 'package:news_app/shared/network/local/cache_helper.dart';

class NewsHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NewsCubit.get(context);
        if (state is NewsInitialState) {
          cubit.getBusinessNews();
        }
        return Scaffold(
          appBar: AppBar(
            title: Text('News App'),
            actions: [
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SearchScreen(),
                    ),
                  );
                },
              ),
              IconButton(
                icon: Icon(Icons.brightness_4),
                onPressed: () {
                  cubit.changeAppThemeMode();
                },
              ),
            ],
          ),
          body: (state is NewsGetBusniessLoadingState ||
                  state is NewsGetScienceLoadingState ||
                  state is NewsGetSportLoadingState)
              ? Center(child: CircularProgressIndicator())
              : cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            items: cubit.bottomItems,
            currentIndex: cubit.currentIndex,
            onTap: (index) => cubit.changeBottomItem(index),
          ),
        );
      },
    );
  }
}
