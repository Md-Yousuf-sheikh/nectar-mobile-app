import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nectar/core/routing/routes.dart';

class SelectLocationScreen extends StatefulWidget {
  const SelectLocationScreen({super.key});

  @override
  State<SelectLocationScreen> createState() => _SelectLocationScreenState();
}

class _SelectLocationScreenState extends State<SelectLocationScreen> {
  String _zone = 'Banassre';
  String _area = 'Types of your area';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCFCFC),
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 24),
            const Icon(Icons.map_outlined, size: 110, color: Color(0xFF53B175)),
            const SizedBox(height: 20),
            const Text(
              'Select Your Location',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            Text(
              'Switch on your location to stay in tune with what is happening in your area',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey.shade600),
            ),
            const SizedBox(height: 26),
            DropdownButtonFormField<String>(
              value: _zone,
              decoration: const InputDecoration(labelText: 'Your Zone'),
              items: const [
                DropdownMenuItem(value: 'Banassre', child: Text('Banassre')),
                DropdownMenuItem(value: 'Dhanmondi', child: Text('Dhanmondi')),
              ],
              onChanged: (value) => setState(() => _zone = value ?? _zone),
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: _area,
              decoration: const InputDecoration(labelText: 'Your Area'),
              items: const [
                DropdownMenuItem(
                  value: 'Types of your area',
                  child: Text('Types of your area'),
                ),
                DropdownMenuItem(value: 'Residential', child: Text('Residential')),
                DropdownMenuItem(value: 'Commercial', child: Text('Commercial')),
              ],
              onChanged: (value) => setState(() => _area = value ?? _area),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () => context.go(PageRoutes.authLogin),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF53B175),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Text(
                  'Submit',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
