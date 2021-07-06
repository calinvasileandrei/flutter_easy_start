import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easy_start/app_widgets/logout_button.dart';
import 'package:flutter_easy_start/pages/login/cubit/login_cubit.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
          color: Theme.of(context).backgroundColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  flex: 1,
                  child: _buildDrawerHeader(context)),
              Expanded(
                  flex: 3,
                  child:  _buildOptions(context)),
              SafeArea(
                child: LogoutButton(),
              )
            ],
          ),
        )
    );
  }

  /// Generate the options listTails
  Widget _buildOptions(BuildContext context){
    return Column(
      children: [
        ListTile(leading: Icon(Icons.arrow_right), title: Text("News",style: Theme.of(context).textTheme.bodyText1,)),
        Divider(),
        ListTile(leading: Icon(Icons.arrow_right),title: Text("Comunicazioni",style: Theme.of(context).textTheme.bodyText1,)),
        Divider(),
        ListTile(leading: Icon(Icons.arrow_right),title: Text("Eventi",style: Theme.of(context).textTheme.bodyText1,)),
        Divider(),
      ],
    );
  }

  /// Generate the drawer header with the user's name
  Widget _buildDrawerHeader(BuildContext context){
    return DrawerHeader(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Benvenuto ",style: Theme.of(context).textTheme.headline5!.copyWith(color: Theme.of(context).accentColor)
          ),
          BlocBuilder<LoginCubit,LoginState>(builder: (_,LoginState state){
            if(state.status == LoginStatus.Authenticated && state.user != null){
              return Text(state.user.firstName,style: Theme.of(context).textTheme.headline5);
            }
            return Text("Utente",style: Theme.of(context).textTheme.headline5);
          })
        ],
      ),
    );
  }
}
