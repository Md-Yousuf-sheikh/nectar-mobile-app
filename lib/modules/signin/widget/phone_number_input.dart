import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class MyPhoneForm extends StatefulWidget {
  final VoidCallback onSubmit;

  const MyPhoneForm({super.key, required this.onSubmit});

  @override
  State<MyPhoneForm> createState() => _MyPhoneFormState();
}

class _MyPhoneFormState extends State<MyPhoneForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController controller = TextEditingController();

  PhoneNumber number = PhoneNumber(isoCode: 'BD');
  bool isPhoneValid = false;

  void _submitPhoneNumber() {
    FocusScope.of(context).unfocus();

    if (formKey.currentState!.validate() && isPhoneValid) {
      formKey.currentState!.save();
      widget.onSubmit();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid phone number')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: InternationalPhoneNumberInput(
        onInputChanged: (PhoneNumber value) {
          number = value;
        },
        onInputValidated: (bool value) {
          setState(() {
            isPhoneValid = value;
          });
        },
        selectorConfig: const SelectorConfig(
          selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
        ),
        ignoreBlank: false,
        autoValidateMode: AutovalidateMode.onUserInteraction,
        selectorTextStyle: const TextStyle(color: Colors.black),
        initialValue: number,
        textFieldController: controller,
        formatInput: true,
        keyboardType: const TextInputType.numberWithOptions(
          signed: false,
          decimal: false,
        ),
        keyboardAction: TextInputAction.done,
        onSubmit: () {
          _submitPhoneNumber();
        },
        inputBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'Phone number is required';
          }

          if (!isPhoneValid) {
            return 'Enter a valid phone number';
          }

          return null;
        },
        onSaved: (PhoneNumber value) {
          number = value;
        },
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
