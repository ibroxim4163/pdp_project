import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdp_project/src/common/constants/custom_error.dart';
import 'package:pdp_project/src/common/services/secure_storage_servise.dart';

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
          final user = await repository.getToken(
            event.username,
            event.password,
          );
          SecureStorage().writeSecureStore(user);
          tokenAccess = user.access;
          tokenRefresh = user.refresh;
          emit(
            SignInSuccess(
              username: event.username,
              password: event.password,
            ),
          );
        } catch (e) {
          if (e is AdminRegisterError) {
            emit(SignInErrorState(
                username: "", password: "", message: e.message));
          } else {
            print("asasasasasasasasas");
            print(e);
            emit(
              SignInErrorState(
                username: state.username,
                password: state.password,
                message: "This username did not found",
              ),
            );
          }
        }
      },
    );
  }
}
