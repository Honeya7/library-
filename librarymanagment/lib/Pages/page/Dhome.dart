import 'dart:io';
import 'package:flutter/material.dart';
import 'package:librarymanagment/Pages/database/book.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:librarymanagment/Pages/database/Bookdb.dart';

class DHome extends StatefulWidget {
  final Book book;
  const DHome({super.key, required this.book});

  @override
  State<DHome> createState() => _DHomeState();
}

class _DHomeState extends State<DHome> {
  @override
  Widget build(BuildContext context) {
    var book = widget.book.book;
    var author = widget.book.author;
    var read = widget.book.read;
    var count = widget.book.count;
    return RawMaterialButton(
      onPressed: () {
        Navigator.pushNamed(context, 'inf', arguments: {
          'book': widget.book.book,
          'author': widget.book.author,
          'photo': widget.book.photo,
          'year': widget.book.year,
          'time': widget.book.time,
          'read': widget.book.read,
          'count': widget.book.count,
          'information': widget.book.information,
        });
      },
      child: Slidable(
        key: const ValueKey(0),
        startActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: ((context) {
                deleted();
              }),
              backgroundColor: const Color(0xFFFE4A49),
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
            SlidableAction(
              onPressed: ((context) {
                Navigator.pushNamed(context, 'add', arguments: {
                  'book': widget.book.book,
                  'id': widget.book.id,
                  'author': widget.book.author,
                  'year': widget.book.year,
                  'read': widget.book.read,
                  'count': widget.book.count,
                  'time': widget.book.time,
                  'information': widget.book.information,
                  'photo': widget.book.photo,
                });
              }),
              backgroundColor: const Color(0xFF21B7CA),
              foregroundColor: Colors.white,
              icon: Icons.update,
              label: 'Update',
            ),
          ],
        ),
        child: Stack(
          children: [
            Card(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 180,
                      child: Image.file(
                        File(widget.book.photo),
                        height: 125,
                        width: 110,
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(
                      width: 180,
                      height: 110,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Name Book: $book",
                              style: const TextStyle(color: Colors.black),
                            ),
                            Text("Name Author: $author",
                                style: const TextStyle(color: Colors.black)),
                            const Row(
                              children: [
                                Text("see more...",
                                    style: TextStyle(color: Colors.black)),
                                Padding(
                                  padding: EdgeInsets.only(left: 3.0),
                                  child: Icon(
                                    Icons.ads_click,
                                    size: 17,
                                    color: Colors.black,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 214, 89, 17),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        bottomLeft: Radius.circular(60))),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                      child: Text(
                    '$read / $count',
                    style: const TextStyle(color: Colors.white),
                  )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future deleted() {
    var nameitem = widget.book.book;
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).colorScheme.background,
              ),
              height: 130,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Expanded(
                      child: Text(
                        'Are you sure delete $nameitem',
                        style: const TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 11, 0, 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                              onPressed: delete,
                              child: Text(
                                'OK',
                                style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                ),
                              )),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                'No',
                                style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                ),
                              ))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  delete() async {
    final book = Book(
      id: widget.book.id,
      book: widget.book.book,
      author: widget.book.author,
      photo: widget.book.photo,
      year: widget.book.year,
      read: widget.book.read,
      count: widget.book.read,
      time: widget.book.time,
      information: widget.book.information,
    );
    BookDb.delete(book: book);
    Navigator.pushNamed(context, 'home');
  }
}
