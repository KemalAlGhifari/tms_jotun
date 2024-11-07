import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:tms_jotun/src/models/response/login.response.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc()
      : super(
          DataUser(
            Login(),
          ),
        ) {
    {
      on<UpdateUser>((event, emit) {
        emit(DataUser(event.userModel) as UserState);

        
      });
    }
  }
}