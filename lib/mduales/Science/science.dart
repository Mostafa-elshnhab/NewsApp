import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/Shared/Componants/reusable_componants.dart';
import 'package:newsapp/Shared/Cubit/States.dart';
import 'package:newsapp/Shared/Cubit/cubit.dart';

class Science extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          List<dynamic> data = AppCubit.get(context).scienceData;
          return (data.length > 0)
              ? newsItemBuildes(data)
              : Center(child: CircularProgressIndicator());
        });
  }
}
