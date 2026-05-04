import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/routing/routes.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg/welcome-bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Center(
                child: Image(
                  image: AssetImage('assets/icons/icon.png'),
                  width: 150,
                  height: 100,
                ),
              ),
              Text(
                "Welcome\nto our store",
                style: TextStyle(
                  fontSize: 48,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                "Get your groceries in as fast as one hour",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade200,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 30),
              // btn
              ElevatedButton(
                onPressed: () => context.go(PageRoutes.shop),
                child: Text(
                  'Get Started',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade600,
                  foregroundColor: Colors.white,
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
