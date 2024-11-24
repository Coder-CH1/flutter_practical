import 'package:assessment/reusable_widgets/textformfield.dart';
import 'package:assessment/state_management/auth_bloc.dart';
import 'package:assessment/state_management/auth_event.dart';
import 'package:flutter/material.dart';
import 'package:assessment/reusable_widgets/text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../reusable_widgets/button.dart';
import '../user_vehicle/add_vehicle_screen.dart';

/// MAIN LOGIN
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
      body: const FormField(),
    );
  }
}

/// FORM FIELD
class FormField extends StatefulWidget {
  const FormField({super.key});

  @override
  State<FormField> createState() => _FormFieldState();
}

class _FormFieldState extends State<FormField> {
/// DECLARING AND INITIALIZING VARIABLES
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late bool _obscureText = true;

  @override
  void dispose() {
    _passwordController.dispose();
    _emailController.dispose();
    super.dispose();
  }

/// METHOD FOR LOGGING USER
  void _login(BuildContext context) async {
    if (_form.currentState!.validate()) {
      return;//RETURNS IF VALIDATION FAILS
    }

/// METHOD FOR CHECKING SPACE
    final email = _emailController.text.trim();
    final pass =  _passwordController.text.trim();
    if (email.isEmpty || pass.isEmpty) {
      return;
    }

    try {
/// DISPATCHES THE LOGIN EVENT
  context.read<AuthBloc>().add(FetchLoginUser(
    email,
    pass));
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Log in successfull'),
      ),
      );
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const AddVehicleScreen()));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Signing failed $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _form,
      child: Column(
        children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.all(12.0),
              child: CustomText(text: 'Log In', style: TextStyle(
                fontSize: 16,
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
                const CustomText(text:'LOG IN WITH...',
                  style: TextStyle(
                      fontSize: 10,
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
                const CustomText(text:'LOG IN WITH EMAIL',
                  style: TextStyle(
                      fontSize: 10,
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
                const Align(
                  alignment: Alignment.centerLeft,
                  child: CustomText(text:'Email address',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF2F4F4F)
                    ),
                  ),
                ),
                CustomTextField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email address is required';
                    }
                    return null;
                  },
                  onSaved: (value) => _emailController.text = value!,
                  controller: _emailController,
                  hintText: '',
                  labelText: '', onPressed: () { },
                ),
                const SizedBox(
                  height: 20,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: CustomText(text:'Password',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF2F4F4F)
                    ),
                  ),
                ),
                CustomTextField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password is required';
                    }
                    return null;
                  },
                  onSaved: (value) => _passwordController.text = value!,
                  controller: _passwordController,
                  hintText: '',
                  labelText: '',
                  obscureText: _obscureText, onPressed: () {  },
                  suffixIcon: IconButton(
                    color: Colors.grey.shade600,
                    icon: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  ),
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
                    buttonText: 'LOG IN', onPressed: () => _login(context), color: const Color(0xFF032B44), borderRadius: 5.0,
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
                const CustomText(text:'Touch/Face ID',
                  style: TextStyle(
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
                    const CustomText(text:'Don t have an account?',
                      style: TextStyle(
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
      ),
    );
  }
}
