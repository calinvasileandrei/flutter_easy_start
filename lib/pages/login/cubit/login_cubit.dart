import 'package:bloc/bloc.dart';
import 'package:flutter_easy_start/app/app.dart';
import 'package:flutter_easy_start/core/app_theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easy_start/core/app_toast.dart';
import 'package:flutter_easy_start/core/models/user.dart';
import 'package:flutter_easy_start/core/repositories/auth_repository.dart';
import 'package:flutter_easy_start/routing/router_constants.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

enum LoginStatus { Authenticated,Unauthenticated,Uninitialized}

loadView(context,route) async{
  await Future.delayed(const Duration(seconds: 1), (){
    Navigator.pushNamedAndRemoveUntil(context, route,(Route<dynamic> route) => false);
  });
}


class LoginCubit extends Cubit<LoginState> {
  User user;
  final AuthRepository repository;
  LoginStatus status;


  LoginCubit(this.repository) : super(LoginState()) {
    LoginOnStartUp();
  }

  Future<void> LoginOnStartUp() async {
    emit(LoginState(loading: false,status: LoginStatus.Uninitialized));
    user = await repository.getUser();
    if(user !=null){
      emit(LoginState(user: user,token: user.token,status: LoginStatus.Authenticated,loading: false));
    }else{
      emit(LoginState(user: null,token: null,status: LoginStatus.Unauthenticated,loading: false));
    }
  }

  Future<void> Login({Key key,String email,String password}) async {
    emit(LoginState(loading: true));
    user = await repository.authenticate(email: email, password: password);

    if(user == null){
      showToastTop(message: 'Credenziali errate!',bgColor: Theme.of(navigatorKey.currentContext).backgroundColor);
      emit(LoginState(user: null,token: null,status: LoginStatus.Unauthenticated,loading: false));
    }else{
      await repository.persistUser(user);
      emit(LoginState(user: null,token: null,status: LoginStatus.Unauthenticated,loading: false));
      loadView(navigatorKey.currentContext,tabControllerPageRoute);
    }
  }

  Future<void> Logout() async {
    emit(LoginState(loading: true));
    await repository.deleteUser();
    emit(LoginState(user: null,token: null,status: LoginStatus.Unauthenticated,loading: false));
  }

  bool isAuth(){
    if(user != null && status == LoginStatus.Authenticated){
      return true;
    }

    return false;
  }
}
