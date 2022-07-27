// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, unused_local_variable

import 'package:appto/todo_provider.dart';
import 'package:appto/widgets/todo_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _tcontroller = TextEditingController(text: "");
  _handleAddtodo() {
    if (_tcontroller.text.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("please add something")));
      return;
    }
    TodoProvider todo_provider =
        Provider.of<TodoProvider>(context, listen: false);

    todo_provider.addtodo(_tcontroller.text);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    TodoProvider todo_provider = Provider.of<TodoProvider>(context);

    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: _buildApp(),
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(children: [
              SearchBox(),
              Expanded(
                child: ListView(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 50, bottom: 20),
                      child: Text(
                        'All ToDos',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w500),
                      ),
                    ),
                    TodoItem(data: "gfgfg gd xg", isComplete: true),
                  ],
                ),
              )
            ]),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                    child: Container(
                  margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 0.0),
                            blurRadius: 10.0,
                            spreadRadius: 0.0)
                      ],
                      borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    controller: _tcontroller,
                    decoration: InputDecoration(
                        hintText: 'add a new todo item',
                        border: InputBorder.none),
                  ),
                )),
                Container(
                    margin: EdgeInsets.only(bottom: 20, right: 20),
                    // child: ElevatedButton(
                    //     onPressed: () {},
                    //     child: Text('+'),
                    //     style: ElevatedButton.styleFrom(
                    //       minimumSize: Size(60, 60),
                    //       elevation: 10,
                    //     )),

                    child: FloatingActionButton.extended(
                      onPressed: _handleAddtodo,
                      label: Icon(Icons.add),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget SearchBox() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(0),
            prefixIcon: Icon(
              Icons.search,
              color: Colors.grey,
              size: 20,
            ),
            prefixIconConstraints: BoxConstraints(maxHeight: 20, minWidth: 25),
            border: InputBorder.none,
            hintText: 'search',
            hintStyle: TextStyle(color: Colors.grey[300])),
      ),
    );
  }

  AppBar _buildApp() {
    return AppBar(
      backgroundColor: Colors.grey[300],
      elevation: 0,
      title: Row(
        children: [
          Icon(
            Icons.menu,
            color: Colors.grey[850],
            size: 30,
          )
        ],
      ),
    );
  }
}
