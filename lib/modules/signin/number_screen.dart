import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:nectar/core/routing/routes.dart';

class NumberScreen extends StatefulWidget {
  const NumberScreen({super.key});

  @override
  State<NumberScreen> createState() => _NumberScreenState();
}

class _NumberScreenState extends State<NumberScreen> {
  final _formKey = GlobalKey<FormState>();
  final _controller = TextEditingController();
  PhoneNumber _number = PhoneNumber(isoCode: 'BD');
  bool _isPhoneValid = false;

  void _continue() {
    FocusScope.of(context).unfocus();
    if (_formKey.currentState?.validate() != true || !_isPhoneValid) return;
    context.push(PageRoutes.verification);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCFCFC),
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),
            const Text(
              'Enter your mobile number',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 28),
            Form(
              key: _formKey,
              child: InternationalPhoneNumberInput(
                onInputChanged: (value) => _number = value,
                onInputValidated: (value) => setState(() => _isPhoneValid = value),
                initialValue: _number,
                textFieldController: _controller,
                selectorConfig: const SelectorConfig(
                  selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                ),
                autoValidateMode: AutovalidateMode.onUserInteraction,
                keyboardType: const TextInputType.numberWithOptions(decimal: false),
                inputDecoration: const InputDecoration(labelText: 'Mobile Number'),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Enter your number';
                  }
                  if (!_isPhoneValid) return 'Enter a valid number';
                  return null;
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _continue,
        backgroundColor: const Color(0xFF53B175),
        child: const Icon(Icons.arrow_forward, color: Colors.white),
      ),
    );
  }
}
