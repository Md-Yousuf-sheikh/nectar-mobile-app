import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nectar/core/routing/routes.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final _codeController = TextEditingController();

  void _continue() {
    if (_codeController.text.trim().length < 4) return;
    context.push(PageRoutes.selectLocation);
  }

  @override
  void dispose() {
    _codeController.dispose();
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
              'Enter your 4-digit code',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 28),
            TextField(
              controller: _codeController,
              keyboardType: TextInputType.number,
              maxLength: 4,
              decoration: const InputDecoration(labelText: 'Code'),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                'Resend Code',
                style: TextStyle(color: Color(0xFF53B175)),
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
