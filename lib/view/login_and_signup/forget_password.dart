
import 'package:flutter/material.dart';
import 'package:second_project/resources/components/custom_button.dart';
import 'package:second_project/resources/components/custom_textfield.dart';
import 'package:second_project/resources/constants/colors.dart';
import 'package:second_project/view/login_and_signup/login_screen.dart';


class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});

  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        forceMaterialTransparency: true,
        elevation: 0,
        // centerTitle: true,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black,
          ),
        ),
        title:  Text(
          "Forgot Password",
          style: TextStyle(
            color: secondColorH,
            fontWeight: FontWeight.w600,
            fontSize: 18,
            letterSpacing: 0.5,
          ),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(image.bg2), fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height / 6),
                Hero(
                    tag: "registernow",
                    child: Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          color: secondColorH,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Center(
                          child: Icon(
                        Icons.directions_car_filled,
                            color: mainColorH,
                            size: 35,
                          ),
                        ))),
                const SizedBox(height: 25),
                const Text(
                  "Enter your email & will send you instruction on how to reset it",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 25),
                MyTextField(
                  validation: (p0) => validations.emailValidation(p0)!,
                  controller: emailController,
                  hintText: "Email address",
                  obscureText: false,
                ),
                const SizedBox(height: 25),
                MyButton(onTap: () {}, title: "Send")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
