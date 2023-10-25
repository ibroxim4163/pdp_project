import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/repositories/api_repository2.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final ApiRepositoryImp repository;
  SignInBloc(this.repository)
      : super(const CheckingUserState(
          password: "",
          username: "",
        )) {
    on<SignInUserEvent>(
      (event, emit) {
        // try {} catch (e) {}
      },
    );
  }
}
