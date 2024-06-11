// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_agriculture_monitoring/Screens/RegisterView.dart';
import 'package:smart_agriculture_monitoring/ViewModel/Auth_ViewModel.dart';
import 'package:smart_agriculture_monitoring/core/Font.dart';
import 'package:smart_agriculture_monitoring/core/image.dart';
import 'package:smart_agriculture_monitoring/core/theme.dart';

class LoginView extends GetWidget<AuthViewModel> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsetsDirectional.symmetric(
                  horizontal: 10,
                  vertical: 20,
                ),
                height: MediaQuery.sizeOf(context).height,
                width: MediaQuery.sizeOf(context).width,
                child: Form(
                  key: formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        child: Image.asset(
                          height: MediaQuery.sizeOf(context).height * .2,
                          fit: BoxFit.fill,
                          "${AssetsImage.imagelogo}",
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        height: MediaQuery.sizeOf(context).height * .6,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: MaterialTheme.lightMediumContrastScheme()
                                  .primary),
                          // color:
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              15,
                            ),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "welecome",
                                  style: getBoldTextStyle(
                                    context: context,
                                  ),
                                ),
                              ],
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Sign In To Cotinue",
                                style: getRegulerTextStyle(
                                  context: context,
                                  color: const Color.fromARGB(
                                    255,
                                    123,
                                    122,
                                    122,
                                  ),
                                ),
                              ),
                            ),
                            TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Enter Your Email";
                                }

                                if (!RegExp("^[a-zA-Z0-9]+@[a-zA-Z0-9]+.[a-z]")
                                    .hasMatch(value)) {
                                  return ("Please Enter a valid Email");
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
                                label: Text("Password"),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                onPressed: () {},
                                child: Text(
                                  "Forget The Pass?",
                                  style: getRegulerTextStyle(
                                    color: MaterialTheme
                                            .lightMediumContrastScheme()
                                        .primary,
                                    context: context,
                                  ),
                                ),
                              ),
                            ),
                            ElevatedButton(
                              style: ButtonStyle(
                                // backgroundColor: MaterialStatePropertyAll(
                                //     MaterialTheme.lightMediumContrastScheme()
                                //         .primary),
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
                                    controller.signInWithEmailAndPassword();
                                  } on Exception catch (e) {
                                    print(e);
                                  }
                                }
                              },
                              child: Text(
                                "Sign In",
                                style: getMediumTextStyle(
                                  color: Colors.white,
                                  context: context,
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text("Don't have an account?"),
                                //
                                InkWell(
                                  onTap: () {
                                    // Get.to(RegisterView());
                                    Get.to(RegisterView());
                                  },
                                  child: Text(
                                    "Create Account",
                                    style: getMediumTextStyle(
                                      context: context,
                                      color: MaterialTheme
                                              .lightMediumContrastScheme()
                                          .primary,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      // ElevatedButtonSignInWithEmailAndPassword(
                      // formkey: formkey, controller: controller),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
