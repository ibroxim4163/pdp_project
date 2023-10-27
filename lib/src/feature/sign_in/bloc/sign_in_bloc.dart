import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdp_project/src/feature/sign_in/models/sign_in_model.dart';

import '../repository/sign_in_repository.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final SignInRepositoryImp repository;
  SignInBloc(this.repository)
      : super(const CheckingUserState(
          password: "",
          username: "",
        )) {
    on<SignInUserEvent>(
      (event, emit) async {
        try {
          emit(SignInLoading(
            username: state.username,
            password: state.password,
          ));
          final SignInModel signInModel = await repository.signUserIn(
            event.username,
            event.password,
          );
        } catch (e) {
          emit(
            SignInErrorState(
              username: state.username,
              password: state.password,
              message: "This username did not found",
            ),
          );
        }
      },
    );
  }
}
