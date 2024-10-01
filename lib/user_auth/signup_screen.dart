import 'package:flutter/material.dart';

import '../reusable_widgets/button.dart';
import '../reusable_widgets/text.dart';
import '../reusable_widgets/textformfield.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool? isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
        title: Image.asset('assets/images/guliva_header.png'),
      ),
      body: Form(
          child: Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 12.0),
            child: Column(
              children: [
                 CustomText(text: 'SIGN UP WITH EMAIL', style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF001F44),
                  fontWeight: FontWeight.w300,
                ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: CustomText(text:'Last Name',
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF2F4F4F)
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
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
                  child: CustomText(text:'Email address',
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF2F4F4F)
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
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
                  child: CustomText(text:'Phone Number',
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF2F4F4F)
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
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
                  child: CustomText(text:'Email',
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF2F4F4F)
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
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
                  child: CustomText(text:'Date of Birth',
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF2F4F4F)
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
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
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                   Checkbox(
                     value: isSelected,
                     checkColor: const Color(0xFFFFFFFF),
                     activeColor: const Color(0xFF032B44),
                     fillColor: WidgetStateProperty.resolveWith((states) {
                       if (!states.contains(WidgetState.selected)) {
                         return const Color(0xFF032B44);
                       }
                       return null;
                     }),
                     onChanged: (value) {


                       setState(() {
                         isSelected = value;
                       });
                     },
                   ),
                    CustomText(text:'I agree to the',
                      style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF2F4F4F)
                      ),
                    ),
                    TextButton(
                      onPressed: () {  }, child: const Text('Terms & Conditions',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: Colors.red,
                      ),
                    ),
                    ),
                    CustomText(text:'and',
                      style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF2F4F4F)
                      ),
                    ),
                    TextButton(
                      onPressed: () {  }, child: const Text('Privacy Policy',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: Colors.red,
                      ),
                    ),
                    ),
                  ],
                ),
                    SizedBox(
            height: 40,
            width: 400,
            child: CustomButton(
              buttonText: 'SIGN UP', onPressed: () {  }, color: const Color(0xFF001F44), borderRadius: 5.0,
            ),
                    ),
              ],
            ),
          )
      ),
    );
  }
}
