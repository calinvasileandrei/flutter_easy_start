part of 'login_cubit.dart';

class LoginState {
  LoginState({Key key, this.user,this.token,this.status,this.loading});

  final user;
  final String token;
  final LoginStatus status;
  final bool loading;
}
