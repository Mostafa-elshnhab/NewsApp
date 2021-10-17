import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/data/remot/dio/dio_helper.dart';
import 'package:newsapp/mduales/Science/science.dart';
import 'package:newsapp/mduales/Sports/sports.dart';
import 'package:newsapp/mduales/business/business.dart';
import 'package:newsapp/mduales/settings/settings.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'States.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(InitialAppState());
  static AppCubit get(context) => BlocProvider.of(context);
  int curentIndex = 0;
  List<Widget> pages = [
    Business(),
    Sports(),
    Science(),
  ];
  List<String> titles = [
    ' Business',
    'Sports',
    'Science',
  ];
  List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(
        icon: Icon(Icons.business_sharp), label: 'Business'),
    BottomNavigationBarItem(icon: Icon(Icons.sports), label: 'Sports'),
    BottomNavigationBarItem(icon: Icon(Icons.science), label: 'Science'),
  ];
  void ChangeCurentIndex(index) {
    curentIndex = index;
    emit(ChangeBottomNavState());
  }

  List<dynamic> businessData = [];
  List<dynamic> sportsData = [];
  List<dynamic> scienceData = [];
  List<dynamic> searchData = [];
  getBusinessData() {
    DioHelper.getDate(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'business',
      'apiKey': 'c853403822a64f219b2c3731f049696d'
    }).then((value) {
      businessData = value.data['articles'];
      emit(GetBusinessDataState());
    }).catchError((error) {
      print(error);
      emit(BusinessDataErorrState());
    });
  }

  getSportsData() {
    DioHelper.getDate(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'sports',
      'apiKey': 'c853403822a64f219b2c3731f049696d'
    }).then((value) {
      sportsData = value.data['articles'];
      emit(GetSportsDataState());
    }).catchError((error) {
      print(error);
      emit(SportsDataErorrState());
    });
  }

  getScienceData() {
    DioHelper.getDate(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'science',
      'apiKey': 'c853403822a64f219b2c3731f049696d'
    }).then((value) {
      scienceData = value.data['articles'];
      emit(GetScienceDataState());
    }).catchError((error) {
      print(error);
      emit(ScienceDataErorrState());
    });
  }

  getSearchData(value) {
    DioHelper.getDate(url: 'v2/everything', query: {
      'q': '$value',
      'apiKey': 'c853403822a64f219b2c3731f049696d'
    }).then((value) {
      searchData = value.data['articles'];
      emit(GetSearchDataState());
    }).catchError((error) {
      print(error);
      emit(SearchDataErorrState());
    });
  }

  bool isDark = false;

  void ChangeMode() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    isDark = !isDark;
    prefs.setBool('idDark', isDark);
    emit(ChangeModeState());
  }

  void onOpen() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    isDark = prefs.getBool('idDark') ?? false;
  }
}
