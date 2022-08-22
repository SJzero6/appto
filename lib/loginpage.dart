// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:appto/home.dart';
import 'package:appto/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class login extends StatefulWidget {
  login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final _emailtextcontroller = TextEditingController();

  final _passwordtextcontroller = TextEditingController();

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
                  textInputAction: TextInputAction.done,
                  obscureText: true,
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
                  label: Text('Sign in'),
                  onPressed: signin,
                ),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: ((context) => Register())));
                  },
                  child: Text('NEW USER ? REGISTER HERE !'))
            ],
          ),
        ),
      )),
    );
  }

  signin() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailtextcontroller.text.trim(),
      password: _passwordtextcontroller.text.trim(),
    );
  }
}
