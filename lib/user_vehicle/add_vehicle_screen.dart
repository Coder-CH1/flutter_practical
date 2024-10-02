import 'package:flutter/material.dart';
import '../reusable_widgets/text.dart';
import '../reusable_widgets/textformfield.dart';

class AddVehicleScreen extends StatefulWidget {
  const AddVehicleScreen({super.key});

  @override
  State<AddVehicleScreen> createState() => _AddVehicleScreenState();
}

class _AddVehicleScreenState extends State<AddVehicleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Image.asset('assets/images/guliva_header.png'),
      ),
      body: Column(
        children: [
           Align(
             alignment: Alignment.centerLeft,
             child: Padding(
               padding: const EdgeInsets.all(15.0),
               child: CustomText(text: 'Add Vehicle', style: const TextStyle(
                 fontSize: 20,
                 color: Color(0xFF032B44),
                 fontWeight: FontWeight.w500,
               ),),
             ),
           ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                color:  Colors.white,
                child: const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: FormField(),
                ),
              ),
            ),
          )
        ],
      )
    );
  }
}

class FormField extends StatefulWidget {
  const FormField({super.key});

  @override
  State<FormField> createState() => _FormFieldState();
}

class _FormFieldState extends State<FormField> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: CustomText(text:'Type of vehicle',
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
            labelText: '', onPressed: () {  },
          ),
          const SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: CustomText(text:'Name of vehicle',
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
            labelText: 'e.g. Benz AL340',
            onPressed: () {  },
          ),
          const SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: CustomText(text:'Model',
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
            labelText: '', onPressed: () {  },
          ),
          const SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: CustomText(text:'Color',
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
            labelText: '', onPressed: () {  },
          ),
          const SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: CustomText(text:'Year',
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
            labelText: '', onPressed: () {  },
          ),
          const SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: CustomText(text:'Value of vehicle',
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
            labelText: '', onPressed: () {  },
          ),
        ],
      ),
    );
  }
}
