import 'package:flutter/material.dart';
import 'package:flutter_app_news/modules/business/business_screen.dart';
import 'package:flutter_app_news/modules/science/science_screen.dart';
import 'package:flutter_app_news/modules/sports/sports_screen.dart';
import 'package:flutter_app_news/shared/cubits/news_cubit/states.dart';
import 'package:flutter_app_news/shared/network/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  // Bottom Navigation Bar
  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomItems = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.business),
      label: 'Business',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.sports),
      label: 'Sports',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.science),
      label: 'Science',
    ),
  ];

  List<Widget> screens = const [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
  ];

  void changeBottomNavigator(int index) {
    currentIndex = index;
    emit(NewsBottomNavigationbarState());
  }

  //business
  static List<dynamic> businessData = [];

  void getBusinessData(String category) {
    if (businessData.isEmpty) {
      emit(NewsReloadState());
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'category': category,
          'country': 'eg',
          'apiKey': 'e43299d7366e4f0aac3d65bb4253a1e6'
        },
      ).then((value) {
        businessData = value.data['articles'];
        emit(NewsGetBusinessSuccessState());
      }).catchError((error) {
        emit(NewsGetBusinessErrorState(error.toString()));
      });
    } else {
      emit(NewsGetBusinessSuccessState());
    }
  }

  //sport
  static List<dynamic> sportData = [];

  void getSportData(String category) {
    if (sportData.isEmpty) {
      emit(NewsReloadState());
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'category': category,
          'country': 'eg',
          'apiKey': 'e43299d7366e4f0aac3d65bb4253a1e6'
        },
      ).then((value) {
        sportData = value.data['articles'];
        emit(NewsGetBusinessSuccessState());
      }).catchError((error) {
        emit(NewsGetBusinessErrorState(error.toString()));
      });
    } else {
      emit(NewsGetBusinessSuccessState());
    }
  }

  //scirnce
  static List<dynamic> scienceData = [];

  void getScienceData() {
    if (scienceData.isEmpty) {
      emit(NewsReloadState());
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'category': 'science',
          'country': 'eg',
          'apiKey': 'e43299d7366e4f0aac3d65bb4253a1e6'
        },
      ).then((value) {
        scienceData = value.data['articles'];
        emit(NewsGetBusinessSuccessState());
      }).catchError((error) {
        emit(NewsGetBusinessErrorState(error.toString()));
      });
    } else {
      emit(NewsGetBusinessSuccessState());
    }
  }

//Search
  static List<dynamic> searchData = [];
  void getSearchData(String word) {
    searchData = [];
    if (searchData.isEmpty) {
      emit(NewsReloadState());
      DioHelper.getData(
        url: 'v2/everything',
        query: {
          'q': word.toString(),
          'apiKey': 'e43299d7366e4f0aac3d65bb4253a1e6',
        },
      ).then((value) {
        searchData = value.data['articles'];
        emit(NewsGetBusinessSuccessState());
      }).catchError((error) {
        emit(NewsGetBusinessErrorState(error.toString()));
      });
    } else {
      emit(NewsGetBusinessSuccessState());
    }
  }
}
