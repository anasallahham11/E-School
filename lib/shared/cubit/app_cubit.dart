import 'package:e_school/shared/network/local/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'app_states.dart';


class AppCubit extends Cubit<AppStates>
{
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);


  bool isDark = false;
  void changeAppMode({bool? fromShared}){

    if(fromShared != null) {
      isDark = fromShared;
      emit(ChangeAppModeState());
    } else {
      isDark= !isDark;
      CacheHelper.putBoolean(
        key: 'isDark',
        value: isDark,
      ).then((value)
      {
        emit(ChangeAppModeState());
      });
    }


  }

}