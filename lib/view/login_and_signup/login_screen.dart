import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:second_project/blocs/login/login_bloc_bloc.dart';
import 'package:second_project/resources/components/custom_button.dart';
import 'package:second_project/resources/constants/font_styles.dart';
import 'package:second_project/utils/custom_navbar.dart';
import 'package:second_project/resources/components/custom_textfield.dart';
import 'package:second_project/resources/constants/colors.dart';
import 'package:second_project/resources/constants/image_path.dart';
import 'package:second_project/utils/functions/permissions.dart';
import 'package:second_project/utils/validations.dart';
import 'package:second_project/view/login_and_signup/forget_password.dart';
import 'package:second_project/view/login_and_signup/signup_screen.dart';

import '../../utils/snackbar.dart';

Validations validations = Validations();
ImageUrl image = ImageUrl();

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(image.bg2), fit: BoxFit.cover)),
            child: Center(
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: SingleChildScrollView(
                        child: Form(
                      key: loginKey,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // const SizedBox(height: 50),
                            Hero(
                              tag: "registernow",
                              child: Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Center(
                                  child: Image.asset("assets/image/Frame 2.png",
                                      fit: BoxFit.cover),
                                ),
                              ),
                            ),

                            const SizedBox(height: 10),

                            Row(
                              children: [
                                Text(
                                  'Welcome back to',
                                  style: CustomFontStyles.profileName,
                                ),
                                Text(
                                  ' CARNOVA.',
                                  style: GoogleFonts.poppins(
                                      color: secondColorH,
                                      fontSize: 25,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'You\'ve been missed!',
                              style: TextStyle(
                                color: Colors.grey[700],
                                fontSize: 16,
                              ),
                            ),

                            const SizedBox(height: 25),

                            // email textfield
                            MyTextField(
                              validation: (p0) =>
                                  validations.emailValidation(p0),
                              controller: emailController,
                              hintText: 'Email',
                              obscureText: false,
                            ),

                            const SizedBox(height: 10),

                            // password textfield
                            MyTextField(
                              validation: (p0) =>
                                  validations.passwordValidations(p0),
                              controller: passwordController,
                              hintText: 'Password',
                              obscureText: true,
                            ),

                            const SizedBox(height: 10),

                            // forgot password?
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 24.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ForgotPasswordScreen(),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      'Forgot Password?',
                                      style: TextStyle(
                                        color: secondColorH,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 25),
                            // sign in button
                            BlocConsumer<LoginBloc, LoginBlocState>(
                              listener: (context, state) {
                                if (state is LoginSuccsessState) {
                                  context
                                      .read<LoginBloc>()
                                      .add(HostDetailsFetch());
                                } else if (state is LoginProcessState) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      customSnackbar(context, false,
                                          "Your Profile Under Verification"));
                                } else if (state is LoginWrongPasswordState) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      customSnackbar(
                                          context, false, "Wrong Password"));
                                } else if (state is LoginFailedState) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      customSnackbar(
                                          context, false, "Login Failed"));
                                } else if (state is LoginErrorState) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      customSnackbar(context, false,
                                          "Some Erorr Try again"));
                                } else if (state is LoginDataFetchState) {
                                  context
                                      .read<LoginBloc>()
                                      .add(HostDashboardFetchEvent());
                                } else if (state is HostDashbordFetched) {
                                  navigateToHome(context);
                                }
                              },
                              builder: (context, state) {
                                bool isLOading = state is LoginLoadingState;
                                return MyLoadingButton(
                                  isLoading: isLOading,
                                  title: 'Sign In',
                                  onTap: () {
                                    if (loginKey.currentState!.validate()) {
                                      final mailandpass = {
                                        "email": emailController.text,
                                        "password": passwordController.text
                                      };
                                      context.read<LoginBloc>().add(
                                          LoginClickedEvent(
                                              mailandpass: mailandpass));
                                    }
                                  },
                                );
                              },
                            ),

                            const SizedBox(height: 50),
                            // or continue with google or somethinggggg
                            const SizedBox(height: 50),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Not a member?',
                                    style: TextStyle(color: Colors.grey[700]),
                                  ),
                                  const SizedBox(width: 4),
                                  GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                SignupScreen(),
                                          ),
                                        );
                                      },
                                      child: Text('Register now',
                                          style: TextStyle(
                                            color: secondColorH,
                                            fontWeight: FontWeight.bold,
                                          )))
                                ])
                          ]),
                    ))))));
  }

  navigateToHome(context) async {
    Permissions permissions = Permissions();
    await permissions.locationPermissionChecking(context);
    await permissions.phoneCallPermissionChecking(context);
    await permissions.galleryPermissionChecking(context);
    await permissions.filesPermissionChecking(context);

    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => ScreenParant()),
        (route) => false);
  }
}
