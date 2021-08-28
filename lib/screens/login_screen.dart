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
  TextEditingController _controller = TextEditingController();
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
            Expanded(child: Container()),
            InkWell(
              onTap: () async {
                if (_controller.text.length < 10) {
                  await showMyDialog1();
                } else {
                  await showMyDialog();
                }
              },
              child: Container(
                color: Colors.tealAccent[400],
                height: 40,
                width: 70,
                child: Center(
                  child: Text(
                    'NEXT',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
            SizedBox(height: 40),
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
      padding: EdgeInsets.symmetric(vertical: 5),
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
                SizedBox(width: 10),
                Text('+', style: TextStyle(fontSize: 18)),
                SizedBox(width: 15),
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
              controller: _controller,
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

  Future<void> showMyDialog() {
    return showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'We will be verifying your phone number',
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(height: 10),
                  Text(
                    countryCode + ' ' + _controller.text,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Is this Ok, or would you like to edit the number?',
                    style: TextStyle(fontSize: 13.5),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Edit'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Ok'),
              ),
            ],
          );
        });
  }

  Future<void> showMyDialog1() {
    return showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'There is no number you entered',
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Ok'),
              ),
            ],
          );
        });
  }
}
