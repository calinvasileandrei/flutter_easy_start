import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easy_start/app_widgets/logout_button.dart';
import 'package:flutter_easy_start/pages/login/cubit/login_cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String name = '';

    return Drawer(
      child: Column(
        children: [
          Expanded(
            child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  BlocBuilder<LoginCubit,LoginState>(
                      builder: (_, LoginState state) {
                          if(state.user != null){
                            name = state.user.firstName;
                          }
                        return DrawerHeader(
                            child: name != null ?
                            name.length<=16? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Benvenuto ",style: Theme.of(context).textTheme.subtitle2.copyWith(color: Theme.of(context).accentColor),),
                                Text(name,style: Theme.of(context).textTheme.subtitle2,),
                              ],
                            ):Column(
                              children: [
                                Text("Benvenuto ",style: Theme.of(context).textTheme.subtitle2.copyWith(color: Theme.of(context).accentColor),),
                                SingleChildScrollView(child: Text(name,style: Theme.of(context).textTheme.subtitle2,)),
                              ],
                            ): Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Benvenuto ",style: Theme.of(context).textTheme.subtitle2.copyWith(color: Theme.of(context).accentColor),),
                              ],
                            )
                        );
                      }),
                  ListTile(leading: Icon(Icons.arrow_right), title: Text("Option1",style: Theme.of(context).textTheme.subtitle2,),onTap: ()=> {} ,),
                  Divider(),
                  ListTile(leading: Icon(Icons.arrow_right),title: Text("Option2",style: Theme.of(context).textTheme.subtitle2,) ,onTap: ()=> {} ),
                  Divider(),
                  ListTile(leading: Icon(Icons.arrow_right),title: Text("Option3",style: Theme.of(context).textTheme.subtitle2,),onTap: ()=> {} ),
                  Divider(),
                ]),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 100.h),
            child: LogoutButton(),
          )
        ],
      ),
    );
  }
}
