import 'dart:io';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class information extends StatefulWidget {
  const information({super.key});

  @override
  State<information> createState() => _informationState();
}

// ignore: camel_case_types
class _informationState extends State<information> {
  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as Map;
    var book = arguments['book'];
    var author = arguments['author'];
    var year = arguments['year'];
    var information = arguments['information'];
    var count = arguments['count'];
    var read = arguments['read'];
    var time = arguments['time'];
    var photo = arguments['photo'];

    return Scaffold(
        appBar: AppBar(
          title: const Text("Book"),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Center(
                child: SizedBox(
                  height: 210,
                  width: 210,
                  child: Card(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.file(
                        File(photo),
                        height: 200,
                        width: 200,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text('Name of The Book: $book',
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text('Name of the author: $author',
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text('Year of  publication: $year',
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text('Number of The Page: $count',
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text('Read Page: $read',
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                    'Time Start: ${DateFormat(DateFormat.YEAR_NUM_MONTH_WEEKDAY_DAY).format(time)},${DateFormat(DateFormat.HOUR_MINUTE).format(time)}',
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text('Information: $information',
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ));
  }
}
