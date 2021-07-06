part of 'login_cubit.dart';

class LoginState {
  LoginState({Key? key, this.user,this.status,this.loading});

  final user;
  final LoginStatus? status;
  final bool? loading;

  @override
  String toString() {
    return 'LoadingState(user: $user, status: $status, loading: $loading)';
  }
}
