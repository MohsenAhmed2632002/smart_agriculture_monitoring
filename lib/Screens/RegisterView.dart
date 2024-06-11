// ignore_for_file: must_be_immutable

import 'package:smart_agriculture_monitoring/ViewModel/Auth_ViewModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:smart_agriculture_monitoring/core/Font.dart';
import 'package:smart_agriculture_monitoring/core/theme.dart';

class RegisterView extends GetWidget<AuthViewModel> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: MaterialTheme.lightScheme().primary,
          centerTitle: true,
          title: Text(
            "Sign Up",
            style: getRegulerTextStyle(context: context, color: Colors.white),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.sizeOf(context).height * .8,
            width: MediaQuery.sizeOf(context).width,
            padding: EdgeInsets.all(15),
            child: Form(
              key: formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Sign Up",
                      style: getBoldTextStyle(
                        // Colors.black,
                        context: context,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter Your Name";
                      }
                      return null;
                    },
                    onChanged: (value) {
                      controller.name = value;
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      prefixIconColor: Colors.black,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: MaterialTheme.lightScheme().primary,
                        ),
                      ),
                      label: Text("Name"),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter Your Email";
                      }
                      return null;
                    },
                    onChanged: (value) {
                      controller.email = value;
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      prefixIconColor: Colors.black,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: MaterialTheme.lightScheme().primary,
                        ),
                      ),
                      label: Text("E-mail"),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter Your PassWord";
                      }
                      return null;
                    },
                    onChanged: (value) {
                      controller.password = value;
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.password),
                      prefixIconColor: Colors.black,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: MaterialTheme.lightScheme().primary,
                        ),
                      ),
                      label: Text("PassWord"),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Forget The Pass?",
                        style: getRegulerTextStyle(
                          // Colors.black87,
                          context: context,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButtonsignUpWithEmailAndPassword(
                      formkey: formkey, controller: controller),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ElevatedButtonsignUpWithEmailAndPassword extends StatelessWidget {
  const ElevatedButtonsignUpWithEmailAndPassword({
    super.key,
    required this.formkey,
    required this.controller,
  });

  final GlobalKey<FormState> formkey;
  final AuthViewModel controller;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        // backgroundColor: MaterialStatePropertyAll(
        //     MaterialTheme.lightMediumContrastScheme().primary),
        minimumSize: MaterialStatePropertyAll<Size>(
          Size(
            MediaQuery.sizeOf(context).width * .9,
            MediaQuery.sizeOf(context).height * .08,
          ),
        ),
      ),
      onPressed: () {
        formkey.currentState!.save();
        if (formkey.currentState!.validate()) {
          try {
            controller.signUpWithEmailAndPassword();
          } on Exception catch (e) {
            print(e);
          }
        }
      },
      child: Text(
        "Sign Up",
        style: getMediumTextStyle(
          color: Colors.white,
          context: context,
        ),
      ),
    );
  }
}
