// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_unnecessary_containers

import 'package:afrimotors/data/cars.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List _foundcars = [];
  @override
  void initState() {
    _foundcars = cars;
    super.initState();
  }

  void _runFilter(String enteredKeyWord) {
    List results = [];
    if (enteredKeyWord.isEmpty) {
      results = cars;
    } else {
      results = cars
          .where((users) => users['name']
              .toLowerCase()
              .contains(enteredKeyWord.toLowerCase()))
          .toList();
    }
    setState(() {
      _foundcars = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: TextFormField(
            onChanged: ((value) {
              _runFilter(value);
            }),
            decoration: InputDecoration(
                // fillColor: Colors.white,
                border: OutlineInputBorder(borderSide: BorderSide.none),
                hintText: 'Afric Motors',
                hintStyle: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
                suffixIcon: Icon(
                  Icons.search,
                  color: Colors.white,
                )),
          ),
          backgroundColor: Color.fromARGB(255, 102, 162, 211),
          leading: Icon(Icons.short_text),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     //mainAxisAlignment:MainAxisAlignment.spaceBetween,
          //     children: [
          //       Container(
          //         color: Colors.white,
          //         height: 2,
          //         width: 20,
          //       ),
          //       SizedBox(
          //         height: 6,
          //       ),
          //       Container(
          //         color: Colors.white,
          //         height: 2,
          //         width: 12,
          //       )
          //     ],
          //   ),
          // ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.notifications_outlined),
            )
          ],
        ),
        body: GridView.builder(
            itemCount: _foundcars.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 0.75,
                crossAxisCount: 2,
                crossAxisSpacing: 4.0,
                mainAxisSpacing: 1.0),
            itemBuilder: (content, index) {
              return Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          decoration: BoxDecoration(
                              border:
                                  Border.all(width: 2, color: Colors.black12),
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                  spreadRadius: 0.85,
                                  color: Colors.black12,
                                )
                              ]),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                _foundcars[index]['image'],
                              ),
                              ListTile(
                                title: Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(
                                      _foundcars[index]['name'].toString(),
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    )),
                                subtitle: Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                      _foundcars[index]['price'].toString()),
                                ),
                                trailing: Icon(
                                  Icons.favorite,
                                  color: Colors.black12,
                                ),
                              ),
                            ],
                          )),
                    ),
                  ),
                ],
              );
            }));
  }
}
