import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easy_start/pages/login/cubit/login_cubit.dart';

class LogoutButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: ()=> BlocProvider.of<LoginCubit>(context).Logout(), child: Text('Logout'));
  }
}
