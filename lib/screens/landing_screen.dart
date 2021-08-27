import 'package:flutter/material.dart';

import './login_screen.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 30),
              Text(
                'Welcome to WhatsApp',
                style: TextStyle(
                  color: Colors.teal,
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: size.height / 11),
              Image.asset(
                'assets/bg.png',
                color: Colors.greenAccent[700],
                height: size.height / 2.3,
                width: size.height / 2.3,
              ),
              SizedBox(height: size.height / 11),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyle(color: Colors.black, fontSize: 17),
                    children: [
                      TextSpan(
                        text: 'Agree and Continue to accept the ',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                      TextSpan(
                        text: 'Whatsapp Terms of Service and Privacy Policy',
                        style: TextStyle(color: Colors.cyan),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (ctx) => LoginScreen()),
                    (route) => false,
                  );
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.80,
                  height: 50,
                  child: Card(
                    margin: EdgeInsets.all(0),
                    elevation: 8,
                    color: Colors.greenAccent[700],
                    child: Center(
                      child: Text(
                        'AGREE AND CONTINUE',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                    ),
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
