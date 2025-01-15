import 'package:flutter/material.dart';
import 'package:testing/cart_body/cart_body.dart';

import 'cart_body/modal_but.dart';
import 'modal/items.dart';

void main() {
  runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
   const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<DataItems> items = [
    DataItems(id: '1', name:  'Tap the duc'),
    DataItems(id: '2', name: 'Di hoc'),
    DataItems(id: '3', name: 'Tap the duc'),
    DataItems(id: '4', name: 'Tap the duc'),
    DataItems(id: '5', name: 'Di choi'),
  ];

   void _handAddTask(String name) {
     final newItems = DataItems(id: DateTime.now().toString() , name: name );
     setState(() {
       items.add(newItems);
     });
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 100,
        title: const Text(
            'To Do List',
            style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
            ),
        ),
        backgroundColor: Colors.blue,
      ),
      body:  SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: items.map((item) => CartBody(item: item,)).toList(),
        )
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (BuildContext content) {
                return ModalButton(addTask: _handAddTask);
              },
            );
          },
            child: const Icon(
              Icons.add,
              size: 30,
              color: Colors.white,
            ),
    ),
      );
    }
}