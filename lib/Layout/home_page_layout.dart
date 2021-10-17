import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/Shared/Cubit/States.dart';
import 'package:newsapp/Shared/Cubit/cubit.dart';
import 'package:newsapp/mduales/Search/search.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            items: cubit.items,
            currentIndex: cubit.curentIndex,
            onTap: (index) {
              cubit.ChangeCurentIndex(index);
            },
          ),
          appBar: AppBar(
            title: Text('${cubit.titles[cubit.curentIndex]}'),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Search()));
                  },
                  icon: Icon(
                    Icons.search_rounded,
                  )),
              IconButton(
                  onPressed: () {
                    cubit.ChangeMode();
                  },
                  icon: Icon(
                    Icons.brightness_4,
                  ))
            ],
          ),
          body: cubit.pages[cubit.curentIndex],
        );
      },
    );
  }
}
