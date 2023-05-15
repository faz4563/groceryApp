// ignore_for_file: implementation_imports

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../controller/apicontroller.dart';
import '../../controller/localStorageController.dart';
import '../../models/loginModel.dart';
import '../../utils/ApiConstants.dart';
import '../../utils/Images.dart';
import '../homePage/homePage.dart';
import '../register/register.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginModel loggedInDetails = LoginModel();

  login(context) async {
    var data = {
      "email": usernameController.text.trim(),
      "password": passwordController.text.trim()
    };
    var response =
        await ApiController.post(ApiConstants.LoginApi, jsonEncode(data));
    loggedInDetails = LoginModel.fromJson(response);

    if (loggedInDetails.flag == "T") {
      usernameController.clear();
      passwordController.clear();
      LocalStorage.saveStringtoLocalStorage("loggedIn", "true");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        elevation: 5,
        width: MediaQuery.of(context).size.width / 1.3,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
        dismissDirection: DismissDirection.horizontal,
        content: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
              child: Center(
                  child: FittedBox(
                fit: BoxFit.contain,
                child: Text(
                  loggedInDetails.status.toString(),
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 2),
                ),
              ))),
        ),
      ));
      return Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ));
    } else {
      usernameController.clear();
      passwordController.clear();
      return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        elevation: 5,
        width: MediaQuery.of(context).size.width / 1.3,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
        dismissDirection: DismissDirection.horizontal,
        content: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
              child: Center(
                  child: FittedBox(
                fit: BoxFit.contain,
                child: Text(
                  loggedInDetails.status.toString(),
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 2),
                ),
              ))),
        ),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return SafeArea(
      maintainBottomViewPadding: true,
      bottom: true,
      right: true,
      left: true,
      top: true,
      child: Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: null,
          body: SingleChildScrollView(
            child: Container(
              decoration: const BoxDecoration(color: Colors.white),
              width: width,
              height: height,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 20.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      logo1,
                      width: 280.w,
                      height: 150.h,
                      fit: BoxFit.fitWidth,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      "Friends Groceries",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 48.sp,
                          letterSpacing: 6,
                          color: Colors.black,
                          fontWeight: FontWeight.w900,
                          fontStyle: FontStyle.italic),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    TextFormField(
                      style: const TextStyle(color: Colors.black),
                      controller: usernameController,
                      decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.black,
                          )),
                          label: Text(
                            "Email",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          labelStyle: TextStyle(
                              fontSize: 14,
                              // fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.italic),
                          border: OutlineInputBorder()),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    TextFormField(
                      style: const TextStyle(color: Colors.black),
                      controller: passwordController,
                      decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.black,
                          )),
                          label: Text(
                            "Password",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          labelStyle: TextStyle(
                              fontSize: 14,
                              // fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.italic),
                          border: OutlineInputBorder()),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextButton(
                            onPressed: () {},
                            child: const Text("Forgot Password ?")),
                        ElevatedButton(
                            onPressed: () {
                              FocusManager.instance.primaryFocus?.unfocus();
                              login(context);
                            },
                            child: const Text("Submit")),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: RichText(
                          text: TextSpan(children: [
                        TextSpan(
                          text: "DIDN'T REGISTERED ?",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w800),
                        ),
                        WidgetSpan(
                            child: SizedBox(
                          width: 5.w,
                        )),
                        WidgetSpan(
                            child: InkWell(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const RegisterPage(),
                                ));
                          },
                          child: SizedBox(
                            width: 150,
                            height: 50,
                            child: FittedBox(
                              fit: BoxFit.contain,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 30),
                                child: Text(
                                  "Register here -->",
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w800),
                                ),
                              ),
                            ),
                          ),
                        ))
                      ])),
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
