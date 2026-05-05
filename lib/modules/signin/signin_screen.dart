import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nectar/core/routing/routes.dart';
import 'package:nectar/modules/signin/widget/phone_number_input.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});

  void _goToHome(BuildContext context) {
    context.go(PageRoutes.authLogin);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCFCFC),
      body: Column(
        children: [
          Expanded(
            child: Image.asset(
              'assets/images/bg/auth-header-bg.png',
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                spacing: 5,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Get your groceries\nwith nectar',
                    style: TextStyle(
                      fontSize: 26,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const SizedBox(height: 24),

                  MyPhoneForm(onSubmit: () => _goToHome(context)),

                  const SizedBox(height: 36),

                  Text(
                    'Or connect with social media',
                    style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 30),

                  ElevatedButton.icon(
                    onPressed: () {
                      // Google sign-in logic here
                    },
                    label: const Text(
                      'Continue with Google',
                      style: TextStyle(fontSize: 16),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF5383EC),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  ElevatedButton.icon(
                    onPressed: () {
                      // Facebook sign-in logic here
                    },
                    label: const Text(
                      'Continue with Facebook',
                      style: TextStyle(fontSize: 16),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF4A66AC),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
