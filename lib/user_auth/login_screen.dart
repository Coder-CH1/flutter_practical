import 'package:assessment/reusable_widgets/textformfield.dart';
import 'package:flutter/material.dart';
import 'package:assessment/reusable_widgets/text.dart';

import '../reusable_widgets/button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Image.asset('assets/images/guliva_header.png'),
      ),
      body: Form(
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: CustomText(text: 'Log In', style: const TextStyle(
                      fontSize: 20,
                      color: Color(0xFF032B44),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              //Spacer(),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  children: [
                    CustomText(text:'LOG IN WITH...',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF2F4F4F)
                    ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          height: 55,
                          width: 150,
                          child: ImageTextButton(
                            imagePath: 'assets/images/google.png',
                            buttonText: 'Google',
                            textColor: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF032B44),
                            ),
                            onPressed: () {

                            },
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                         width: 40,
                        ),
                        SizedBox(
                          height: 55,
                          width: 150,
                          child: ImageTextButton(
                            imagePath: 'assets/images/facebook.png',
                            buttonText: 'Facebook',
                            textColor: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF032B44),
                            ),
                            onPressed: () {

                            },
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomText(text:'LOG IN WITH EMAIL',
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF2F4F4F)
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: CustomText(text:'Email address',
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF2F4F4F)
                        ),
                      ),
                    ),
                    const CustomTextField(
                      hintText: '',
                      labelText: '',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: CustomText(text:'Password',
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF2F4F4F)
                        ),
                      ),
                    ),
                    const CustomTextField(
                      hintText: '',
                      labelText: '',
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {  }, child: const Text('Forgot password?',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.red,
                        ),
                      ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                      width: 400,
                      child: CustomButton(
                          buttonText: 'LOG IN', onPressed: () {  }, color: const Color(0xFF032B44), borderRadius: 5.0,
                          ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Icon(
                     Icons.fingerprint,
                      color: Color(0xFF032B44),
                      size: 60,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomText(text:'Touch/Face ID',
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF2F4F4F)
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                     children: [
                       CustomText(text:'Don t have an account?',
                         style: const TextStyle(
                             fontSize: 14,
                             fontWeight: FontWeight.w400,
                             color: Color(0xFF2F4F4F)
                         ),
                       ),
                       TextButton(
                         onPressed: () {  }, child: const Text('Sign up',
                         style: TextStyle(
                           fontSize: 14,
                           fontWeight: FontWeight.w400,
                           color: Colors.red,
                         ),
                       ),
                       ),
                     ],
                    ),
                  ],
                ),
              ),
            ],
          )
      ),
    );
  }
}
