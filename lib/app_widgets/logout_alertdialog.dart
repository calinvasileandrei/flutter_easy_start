import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easy_start/core/app_shapes.dart';
import 'package:flutter_easy_start/pages/login/cubit/login_cubit.dart';

class LogoutAlerDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: AppShapes.appCardShape,
      title: Text(
        "Attenzione",
        style: Theme.of(context).textTheme.subtitle2,
      ),
      content: Text(
        'Sei sicuro di voler uscire?',
        style: Theme.of(context).textTheme.bodyText1,
      ),
      actions: <Widget>[
        TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              "Annulla",
              style: TextStyle(
                color: Colors.red,
              ),
            )),
        TextButton(
            onPressed: () => {
                  BlocProvider.of<LoginCubit>(context).logout(),
                  Navigator.pop(context),
                },
            child: Text(
              "Conferma",
              style: TextStyle(color: Colors.black),
            )),
      ],
    );
  }
}
