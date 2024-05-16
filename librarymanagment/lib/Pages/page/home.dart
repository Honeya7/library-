import 'package:flutter/material.dart';
import 'package:librarymanagment/Pages/database/Bookdb.dart';
import 'package:librarymanagment/Pages/page/drawer/mydrawer.dart';
import 'package:librarymanagment/Pages/page/Dhome.dart';

// ignore: camel_case_types
class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

// ignore: camel_case_types
class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const mydrawer(),
      appBar: AppBar(
        title: const Text("Library"),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                FutureBuilder(
                    future: BookDb.getBook(),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.data == null || snapshot.data.isEmpty) {
                          return const Center(
                            child: Text("Empty"),
                          );
                        }
                        return Column(
                          children: [
                            for (var book in snapshot.data!)
                              DHome(book: book)
                          ],
                        );
                      }
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }),
              ],
            ),
          ),
          Positioned(
              bottom: 30,
              right: 15,
              child: IconButton(
                icon: Container(
                  height: 60,
                  width: 60,
                  decoration: const BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.all(Radius.circular(60))),
                  child: Icon(
                    Icons.add,
                    color: Theme.of(context).colorScheme.primary,
                    size: 40,
                  ),
                ),
                onPressed: () =>
                    Navigator.pushNamed(context, 'add', arguments: {'id': ''}),
              ))
        ],
      ),
    );
  }
}