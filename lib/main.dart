import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newsapp/Shared/Cubit/States.dart';
import 'package:newsapp/Shared/Cubit/cubit.dart';
import 'package:newsapp/data/remot/dio/dio_helper.dart';

import 'Layout/home_page_layout.dart';
import 'Shared/Cubit/cubit_observe.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  DioHelper.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()
        ..onOpen()
        ..getSportsData()
        ..getBusinessData()
        ..getScienceData(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return
            MaterialApp(
            debugShowCheckedModeBanner: false,
            darkTheme: ThemeData(
              textTheme: TextTheme(
                  bodyText1: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white)),
              scaffoldBackgroundColor: Colors.black45.withOpacity(.5),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  backgroundColor: Colors.black45,
                  type: BottomNavigationBarType.fixed,
                  unselectedItemColor: Colors.grey,
                  selectedItemColor: Colors.deepOrange),
              appBarTheme: AppBarTheme(
                backgroundColor: Colors.black45,
                elevation: 0,
                backwardsCompatibility: false,
                iconTheme: IconThemeData(color: Colors.white, size: 22),
                centerTitle: true,
                titleTextStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.black45,
                    statusBarIconBrightness: Brightness.light),
              ),
              primarySwatch: Colors.deepOrange,
            ),
            theme: ThemeData(
              textTheme: TextTheme(
                  bodyText1: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black)),
              scaffoldBackgroundColor: Colors.white,
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.deepOrange),
              appBarTheme: AppBarTheme(
                backgroundColor: Colors.white,
                elevation: 0,
                backwardsCompatibility: false,
                iconTheme: IconThemeData(color: Colors.black, size: 22),
                centerTitle: true,
                titleTextStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.white,
                    statusBarIconBrightness: Brightness.dark),
              ),
              primarySwatch: Colors.deepOrange,
            ),
            themeMode:
                AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            home: HomePage(),
          );
        },
      ),
    );
  }
}
