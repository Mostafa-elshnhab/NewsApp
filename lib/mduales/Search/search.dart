import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/Shared/Componants/reusable_componants.dart';
import 'package:newsapp/Shared/Cubit/States.dart';
import 'package:newsapp/Shared/Cubit/cubit.dart';

class Search extends StatelessWidget {
  var search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        List data = AppCubit.get(context).searchData;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  controller: search,
                  style: Theme.of(context).textTheme.bodyText1,
                  decoration: InputDecoration(
                    hintText: 'Search',
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Colors.deepOrange,
                      ),
                    ),
                    suffixIcon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    hintStyle: TextStyle(
                      color: Colors.grey[400],
                    ),
                  ),
                  onChanged: (value) {
                    AppCubit.get(context).getSearchData(value);
                  },
                ),
              ),
              Expanded(child: newsItemBuildes(data)),
            ],
          ),
        );
      },
    );
  }
}
