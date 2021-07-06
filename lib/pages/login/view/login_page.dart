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
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: SafeArea(
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      width: 200.w,
                      height: 200.h,
                      child: new Image.asset('assets/images/splash.png')),
                  InputTextField(
                      width: 320.w,
                      height: 60.h,
                      controller: emailController,
                      enabledTextField: true,
                      icon: Icons.email,
                      hintText: "Inserire l'email"),
                  SizedBox(height: 20.h),
                  InputTextField(
                      width: 320.w,
                      height: 60.h,
                      obfuscaredText: true,
                      controller: passwordController,
                      enabledTextField: true,
                      icon: Icons.security,
                      hintText: 'Inserire la password'),
                  Container(
                      width: 320.w,
                      height: 60.h,
                      margin: EdgeInsets.only(top: 30.h),
                      child: ElevatedButton(
                          onPressed: () {
                            FocusScope.of(context).requestFocus(new FocusNode());
                            BlocProvider.of<LoginCubit>(context).login(
                                email: emailController.text.trim(),
                                password: passwordController.text.trim());
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Theme.of(context).accentColor,
                            shape: AppShapes.appCardShape,
                          ),
                          child: Text(
                            'LOGIN',
                            style: Theme.of(context).textTheme.button!.copyWith(
                                color: Theme.of(context).backgroundColor),
                          ))),
                  Container(
                    margin: EdgeInsets.only(top: 50.h),
                    width: 30.w,
                    height: 30.h,
                    child: BlocBuilder<LoginCubit, LoginState>(builder: (context, state) {
                      if (state.loading!) {
                        return CircularProgressIndicator();
                      } else {
                        return Container();
                      }
                    }),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
