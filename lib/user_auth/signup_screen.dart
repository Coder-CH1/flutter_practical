import 'package:assessment/auth_manager/auth_manager.dart';
import 'package:assessment/user_vehicle/add_vehicle_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../reusable_widgets/button.dart';
import '../reusable_widgets/text.dart';
import '../reusable_widgets/textformfield.dart';
import 'package:http/http.dart' as http;

//MAIN SIGN UP
class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
        title: Image.asset('assets/images/guliva_header.png'),
      ),
      body: const FormField(),
    );
  }
}

//FORM FIELD
class FormField extends StatefulWidget {
  const FormField({super.key});

  @override
  State<FormField> createState() => _FormFieldState();
}

class _FormFieldState extends State<FormField> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool isSelected = false;
  DateTime? _selectedDate;
  late bool _obscureText = true;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future<void> _signup(BuildContext context) async {
    final authManager = AuthManager(http.Client());

    try {
      authManager.signup(
          _firstNameController.text,
          _lastNameController.text,
          _phoneController.text,
          _emailController.text,
          _passwordController.text,
          DateFormat('yyyy-MM-dd').format(_selectedDate!)
      );
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Signing successfull'),
      ),
      );
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const AddVehicleScreen()));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Signing failed $e')));
    }
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Form(
        child: Padding(
          padding: const EdgeInsets.only(left: 12.0, right: 12.0),
          child: Column(
            children: [
              CustomText(text: 'SIGN UP WITH EMAIL', style: const TextStyle(
                fontSize: 16,
                color: Color(0xFF001F44),
                fontWeight: FontWeight.w300,
              ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: CustomText(text:'First Name',
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
              CustomTextField(
                hintText: '',
                labelText: '',
                inputType: TextInputType.text, onPressed: () {  },
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: CustomText(text:'Last Name',
                  style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF2F4F4F)
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              CustomTextField(
                hintText: '',
                labelText: '',
                inputType: TextInputType.text, onPressed: () {  },
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: CustomText(text:'Phone Number',
                  style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF2F4F4F)
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              CustomTextField(
                hintText: '',
                labelText: '',
                inputType: TextInputType.phone, onPressed: () {  },
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: CustomText(text:'Email',
                  style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF2F4F4F)
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              CustomTextField(
                hintText: '',
                labelText: '',
                inputType: TextInputType.emailAddress, onPressed: () {  },
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: CustomText(text:'Date of Birth',
                  style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF2F4F4F)
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              TextFormField(
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                      icon: const Icon(Icons.calendar_today),
                    color: Colors.grey,
                    onPressed: () {
                      _selectDate(context);
                    },
                  ),
                  hintText: _selectedDate == null
                      ? ''
                      : DateFormat('dd-MM-yyyy').format(_selectedDate!),
                  hintStyle: const TextStyle(color: Colors.grey, fontSize: 12),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
                keyboardType: TextInputType.datetime,
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: CustomText(text:'Password',
                  style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF2F4F4F)
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              CustomTextField(
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
              Row(
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
                        isSelected = value ?? false;
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
                    onPressed: () {}, child: const Text('Terms & Conditions',
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
                  buttonText: 'SIGN UP',
                  onPressed: () => _signup(context),
                  color: isSelected ? const Color(0xFF001F44) : Colors.grey.shade800,
                  borderRadius: 5.0,
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomText(text:'Already have an account?',
                    style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF2F4F4F)
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                    ),
                    onPressed: () {  }, child: const Text('Log In',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: Colors.red,
                    ),
                  ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
