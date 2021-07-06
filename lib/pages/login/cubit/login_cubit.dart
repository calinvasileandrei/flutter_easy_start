import 'package:bloc/bloc.dart';
import 'package:flutter_easy_start/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easy_start/core/app_toast.dart';
import 'package:flutter_easy_start/core/models/user.dart';
import 'package:flutter_easy_start/core/repositories/auth_repository.dart';
import 'package:flutter_easy_start/core/repositories/response_message/response_message.dart';
import 'package:flutter_easy_start/core/repositories/response_message/response_message_status.dart';

part 'login_state.dart';

enum LoginStatus { Authenticated, Unauthenticated, Uninitialized }

class LoginCubit extends Cubit<LoginState> {
  User? user;
  LoginStatus? status;

  LoginCubit() : super(LoginState()) {
    loginOnStartUp();
  }

  /// Event invoked on startup to check if the user has the data saved on the device
  Future<void> loginOnStartUp() async {
    emit(LoginState(loading: false, user: null, status: LoginStatus.Uninitialized));
    user = await AuthRepository.getUser();
    if (user != null) {
      emit(LoginState(user: user, status: LoginStatus.Authenticated, loading: false));
    } else {
      emit(LoginState(user: null, status: LoginStatus.Unauthenticated, loading: false));
    }
  }

  /// Event to login
  Future<void> login({Key? key, String? email, String? password}) async {
    // start loading animation
    emit(LoginState(loading: true, user: user, status: status));
    // make the authentication request to the backend
    ResponseMessage<User?> response = await AuthRepository.authenticate(email: email, password: password);
    //check the response status
    if (response.status == ResponseMessageStatus.s200) {
      user = response.body;
      await AuthRepository.persistUser(user!);
      // if successful login
      emit(LoginState(user: user, status: LoginStatus.Authenticated, loading: false));
    } else {
      // error message
      AppToasts.showToastBottom(message: response.message, context: navigatorKey.currentContext!);
      emit(LoginState(user: null, status: LoginStatus.Unauthenticated, loading: false));
    }
  }

  /// Event to logout the user
  Future<void> logout() async {
    emit(LoginState(user: user, status: status, loading: true));
    await AuthRepository.deleteUser();
    emit(LoginState(user: null, status: LoginStatus.Unauthenticated, loading: false));
  }

  /// Event to check if the user is Authenticated
  bool isAuth() {
    if (user != null && status == LoginStatus.Authenticated) {
      return true;
    }
    return false;
  }
}
