// ignore_for_file: implementation_imports
// ignore: unused_import
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_project/models/addProdModel.dart';
import '../../controller/apicontroller.dart';
import '../../utils/ApiConstants.dart';
import '../../utils/Images.dart';
import '../login/login.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController mobileNumberController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  AddProdModel registeredDetails = AddProdModel();
  signUp(context, name, email, phone, password) async {
    var data = {
      "name": name,
      "email": email,
      "phone": phone,
      "password": password
    };
    var response =
        await ApiController.post(ApiConstants.addUserApi, jsonEncode(data));
    registeredDetails = AddProdModel.fromJson(response);

    if (registeredDetails.flag == "T") {
      nameController.clear();
      emailController.clear();
      mobileNumberController.clear();
      passwordController.clear();
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
                  registeredDetails.status.toString(),
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
            builder: (context) => const LoginPage(),
          ));
    } else {
      nameController.clear();
      emailController.clear();
      mobileNumberController.clear();
      passwordController.clear();
      return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        elevation: 5,
        width: MediaQuery.of(context).size.width / 1.3,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
        dismissDirection: DismissDirection.horizontal,
        // margin:
        //     EdgeInsets.only(bottom: MediaQuery.of(context).size.height / 1.2),
        content: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
              child: Center(
                  child: FittedBox(
                fit: BoxFit.contain,
                child: Text(
                  registeredDetails.status.toString(),
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
              width: width,
              height: height,
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 0.h, horizontal: 20.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      logo,
                      fit: BoxFit.cover,
                      width: 280.w,
                      height: 150.h,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: 300,
                      child: Text(
                        "Friends Groceries",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 28.sp,
                            letterSpacing: 6,
                            color: Colors.black,
                            fontWeight: FontWeight.w900,
                            fontStyle: FontStyle.italic),
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    TextFormField(
                      style: const TextStyle(color: Colors.black),
                      controller: nameController,
                      decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.black,
                          )),
                          label: Text(
                            "Name",
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
                      controller: emailController,
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
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.black,
                          )),
                          label: Text(
                            "Mobile Number",
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
                      controller: mobileNumberController,
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
                      height: 20.h,
                    ),
                    nameController.text.isNotEmpty &&
                            mobileNumberController.text.isNotEmpty &&
                            emailController.text.isNotEmpty &&
                            passwordController.text.isNotEmpty
                        ? ElevatedButton(
                            onPressed: () {
                              FocusManager.instance.primaryFocus?.unfocus();
                              signUp(
                                  context,
                                  nameController.text.trim().toLowerCase(),
                                  emailController.text.trim().toLowerCase(),
                                  mobileNumberController.text
                                      .trim()
                                      .toLowerCase(),
                                  passwordController.text.trim().toLowerCase());
                            },
                            child: const Text("Submit"))
                        : ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent),
                            onPressed: null,
                            child: const Text("Submit")),
                    SizedBox(
                      height: 10.h,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: RichText(
                          text: TextSpan(children: [
                        TextSpan(
                          text: "   Already Registered ?",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w800),
                        ),
                        WidgetSpan(
                            child: SizedBox(
                          width: 0.w,
                        )),
                        WidgetSpan(
                            child: InkWell(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginPage(),
                                ));
                          },
                          child: SizedBox(
                            width: 150,
                            height: 50,
                            child: FittedBox(
                              fit: BoxFit.contain,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 35),
                                child: Text(
                                  "Login Here -->",
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 22.sp,
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
