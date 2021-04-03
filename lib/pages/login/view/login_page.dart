import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easy_start/core/app_shapes.dart';
import 'package:flutter_easy_start/pages/login/cubit/login_cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_easy_start/app_widgets/input_textfield.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController= TextEditingController();
  TextEditingController passwordController= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Container(
            width: ScreenUtil().screenWidth,
            height: ScreenUtil().screenHeight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    margin: EdgeInsets.only(top: 100.h),
                    width: 200,
                    height: 200,
                    child: new Image.asset('assets/images/splash.png')),
                InputTextField(width: ScreenUtil().screenWidth*0.8, height: 150.h, marginVertical: 30.h, controller: emailController, enabledTextField: true, icon: Icons.email, hintText: "Inserire l'email"),
                InputTextField(width: ScreenUtil().screenWidth*0.8, height: 150.h, obfuscaredText: true, marginVertical: 30.h, controller: passwordController, enabledTextField: true, icon: Icons.security, hintText: 'Inserire la password'),
                Container(
                    margin: EdgeInsets.only(top: 50.h),
                    width: ScreenUtil().screenWidth*0.8,
                    height: 150.h,
                    child: ElevatedButton(onPressed: () {
                      FocusScope.of(context).requestFocus(new FocusNode());
                      BlocProvider.of<LoginCubit>(context).Login(email: emailController.text.trim(),password: passwordController.text.trim());
                    },
                        style: ElevatedButton.styleFrom( primary:  Theme.of(context).accentColor , shape: appCardShape,),
                        child: Text('Login',style:  Theme.of(context).textTheme.bodyText1.copyWith(color:  Theme.of(context).backgroundColor),)
                    )
                ),
                    BlocBuilder<LoginCubit,LoginState>(
                      builder: (context, state) {
                        if(state.loading){
                         return Container(
                             margin: EdgeInsets.only(top: 100.h),
                             child: CircularProgressIndicator());
                        }else{
                          return Container();
                        }
                      }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

