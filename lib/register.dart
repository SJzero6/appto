// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'home.dart';

class Register extends StatefulWidget {
  Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _emailtextcontroller = TextEditingController();
  final _passwordtextcontroller = TextEditingController();
  final _confirmpasscontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      // appBar: AppBar(),
      body: SafeArea(
          child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/image/todo.png",
                height: 160,
                width: 160,
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: TextField(
                  controller: _emailtextcontroller,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.mail),
                    border: OutlineInputBorder(),
                    hintText: 'email',
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: TextField(
                  controller: _passwordtextcontroller,
                  obscureText: true,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                      suffixIcon: Icon(Icons.key),
                      border: OutlineInputBorder(),
                      hintText: 'password'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: TextField(
                  controller: _confirmpasscontroller,
                  obscureText: true,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                      suffixIcon: Icon(Icons.key),
                      border: OutlineInputBorder(),
                      hintText: 'password'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size.fromHeight(50),
                    ),
                    icon: Icon(Icons.lock),
                    label: Text('Sign Up'),
                    onPressed: _handleRegister),
              ),
            ],
          ),
        ),
      )),
    );
  }

  _handleRegister() async {
    if (_emailtextcontroller.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Email is required'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    RegExp emailRegExp = RegExp(
        r'^[a-zA-Z0-9.a-zA-Z0-9.!#$%&???*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
    if (!emailRegExp.hasMatch(_emailtextcontroller.text)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Email is not valid'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    if (_passwordtextcontroller.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Password is required'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }
    if (_confirmpasscontroller.text != _passwordtextcontroller.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Passwords do not match'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailtextcontroller.text.trim(),
        password: _passwordtextcontroller.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message ?? "")));
      return;
    }

    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context) => HomePage()), (route) => false);
  }
}
