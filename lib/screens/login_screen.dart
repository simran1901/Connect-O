import 'package:connecto/models/country_model.dart';
import 'package:flutter/material.dart';

import './country_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String countryName = 'India';
  String countryCode = '+91';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Enter your phone number',
          style: TextStyle(
            color: Colors.teal,
            fontWeight: FontWeight.w700,
            fontSize: 18,
            wordSpacing: 1,
          ),
        ),
        centerTitle: true,
        actions: [
          Icon(Icons.more_vert, color: Colors.black),
        ],
      ),
      body: Container(
        height: size.height,
        width: size.width,
        child: Column(
          children: [
            Text(
              'Whatsapp will send an sms message to verify your number',
              style: TextStyle(
                fontSize: 13.5,
              ),
            ),
            SizedBox(height: 5),
            Text(
              "What's my number?",
              style: TextStyle(
                fontSize: 12.8,
                color: Colors.cyan[800],
              ),
            ),
            SizedBox(height: 18),
            countryCard(size),
            SizedBox(height: 5),
            number(),
          ],
        ),
      ),
    );
  }

  Widget countryCard(Size size) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => CountryScreen(setCountryData: setCountryData),
          ),
        );
      },
      child: Container(
        width: size.width / 1.5,
        padding: EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.teal,
              width: 1.8,
            ),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Container(
                child: Center(
                  child: Text(
                    countryName,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ),
            Icon(Icons.arrow_drop_down, color: Colors.teal, size: 28),
          ],
        ),
      ),
    );
  }

  Widget number() {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width / 1.5,
      height: 38,
      child: Row(
        children: [
          Container(
            width: 70,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.teal,
                  width: 1.8,
                ),
              ),
            ),
            child: Row(
              children: [
                Text('+', style: TextStyle(fontSize: 18)),
                SizedBox(width: 20),
                Text(countryCode.substring(1), style: TextStyle(fontSize: 15)),
              ],
            ),
          ),
          SizedBox(width: 30),
          Container(
            width: size.width / 1.5 - 100,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.teal,
                  width: 1.8,
                ),
              ),
            ),
            child: TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(8),
                hintText: 'phone number',
              ),
            ),
          ),
        ],
      ),
    );
  }

  void setCountryData(CountryModel country) {
    setState(() {
      countryName = country.name;
      countryCode = country.code;
    });
    Navigator.of(context).pop();
  }
}
