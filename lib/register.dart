// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

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
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                      // suffixIcon: Icon(Icons.key),
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
                    onPressed: () {}),
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
}
