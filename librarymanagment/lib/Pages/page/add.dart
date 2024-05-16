import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:librarymanagment/Pages/database/book.dart';
import 'package:librarymanagment/Pages/database/Bookdb.dart';

// ignore: camel_case_types
class add extends StatefulWidget {
  const add({super.key});

  @override
  State<add> createState() => _addState();
}

// ignore: camel_case_types
class _addState extends State<add> {
  String selectedImagePath = '';
  String error = '';
  TextEditingController bookController = TextEditingController();
  TextEditingController authorController = TextEditingController();
  TextEditingController yearController = TextEditingController();
  TextEditingController readController = TextEditingController();
  TextEditingController countController = TextEditingController();
  TextEditingController informationController = TextEditingController();
  String buttonName = 'ADD';
  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as Map;
    if (arguments['id'] != '') {
      bookController.text = arguments['book'];
      authorController.text = arguments['author'];
      yearController.text = arguments['year'];
      informationController.text = arguments['information'];
      readController.text = arguments['read'];
      countController.text = arguments['count'];
      selectedImagePath = arguments['photo'];
      buttonName = 'Update';
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("Library"),
      ),
      resizeToAvoidBottomInset: false,
      body: Column(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                color:
                                    Theme.of(context).colorScheme.secondary,
                              ))),
                              child: TextField(
                                controller: bookController,
                                decoration: InputDecoration(
                                    hintText: "Name of The Book",
                                    hintStyle: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                    ),
                                    border: InputBorder.none),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                color:
                                    Theme.of(context).colorScheme.secondary,
                              ))),
                              child: TextField(
                                controller: authorController,
                                decoration: InputDecoration(
                                    hintText: "Name of the author",
                                    hintStyle: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                    ),
                                    border: InputBorder.none),
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                          onPressed: () async {
                            selectImage();
                            setState(() {});
                          },
                          icon: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(
                                Icons.image,
                                size: 100,
                                color:
                                    Theme.of(context).colorScheme.secondary,
                              ),
                              Text(
                                'select image',
                                style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                ),
                              )
                            ],
                          )),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                      color: Theme.of(context).colorScheme.secondary,
                    ))),
                    child: TextField(
                      controller: yearController,
                      decoration: InputDecoration(
                          hintText: "Year of  publication",
                          hintStyle: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          border: InputBorder.none),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        width: 150,
                        padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                          color: Theme.of(context).colorScheme.secondary,
                        ))),
                        child: TextField(
                          controller: readController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              hintText: "Read Page",
                              hintStyle: TextStyle(
                                color:
                                    Theme.of(context).colorScheme.secondary,
                              ),
                              border: InputBorder.none),
                        ),
                      ),
                      Container(
                        width: 150,
                        padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                          color: Theme.of(context).colorScheme.secondary,
                        ))),
                        child: TextField(
                          controller: countController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              hintText: "Page Number",
                              hintStyle: TextStyle(
                                color:
                                    Theme.of(context).colorScheme.secondary,
                              ),
                              border: InputBorder.none),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                      color: Theme.of(context).colorScheme.secondary,
                    ))),
                    child: TextField(
                      controller: informationController,
                      decoration: InputDecoration(
                          hintText: "Additional information",
                          hintStyle: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          border: InputBorder.none),
                    ),
                  ),
                  Text(
                    error,
                    style: const TextStyle(
                        color: Color.fromARGB(255, 248, 2, 2),
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  MaterialButton(
                    onPressed: () {
                      if (selectedImagePath == '' ||
                          bookController.text.isEmpty ||
                          authorController.text.isEmpty ||
                          yearController.text.isEmpty ||
                          readController.text.isEmpty ||
                          countController.text.isEmpty ||
                          informationController.text.isEmpty) {
                        setState(() {
                          error =
                              'Check fields Make sure all fields are filled....';
                        });
                      } else {
                        if (arguments['id'] != '') {
                          updateBook() async {
                            final book = Book(
                                id: arguments['id'],
                                book: bookController.text,
                                author: authorController.text,
                                photo: selectedImagePath,
                                year: yearController.text,
                                read: readController.text,
                                count: countController.text,
                                information: informationController.text,
                                time: arguments['time']);
            
                            BookDb.update(book: book);
                            Navigator.pushNamed(context, 'home');
                          }
            
                          updateBook();
                        } else {
                          insertB() async {
                            final book = Book(
                                book: bookController.text,
                                author: authorController.text,
                                photo: selectedImagePath,
                                year: yearController.text,
                                read: readController.text,
                                count: countController.text,
                                information: informationController.text,
                                time: DateTime.now());
                            BookDb.insert(book: book);
                            Navigator.pushNamed(context, 'home');
                          }
            
                          insertB();
                        }
                      }
                    },
                    height: 50,
                    // margin: EdgeInsets.symmetric(horizontal: 50),
                    color: Theme.of(context).colorScheme.secondary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    // decoration: BoxDecoration(
                    // ),
                    child: Center(
                      child: Text(
                        buttonName,
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Future selectImage() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            child: Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              height: 170,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 11, 0, 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          setState(() async {
                            selectedImagePath = await selectImageFromGallery();
                          });

                          if (kDebugMode) {
                            print('Image_Path:-');
                          }
                          if (kDebugMode) {
                            print(selectedImagePath);
                          }
                          if (selectedImagePath != '') {
                            // ignore: use_build_context_synchronously
                            Navigator.pop(context);
                            setState(() {});
                          }
                        },
                        child: Card(
                            elevation: 5,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: SizedBox(
                                    width: 120,
                                    child: Column(
                                      children: [
                                        Image.asset(
                                          'assets/images/gallery.png',
                                          height: 74,
                                          width: 80,
                                        ),
                                        const Text('Gallery'),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )),
                      ),
                      GestureDetector(
                        onTap: () async {
                          setState(() async {
                            selectedImagePath = await selectImageFromGallery();
                          });
                          if (kDebugMode) {
                            print('Image_Path:-');
                          }
                          if (kDebugMode) {
                            print(selectedImagePath);
                          }

                          if (selectedImagePath != '') {
                            // ignore: use_build_context_synchronously
                            Navigator.pop(context);
                            setState(() {});
                          }
                        },
                        child: Card(
                            elevation: 5,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 1.0),
                                  child: SizedBox(
                                    width: 120,
                                    child: Column(
                                      children: [
                                        Image.asset(
                                          'assets/images/camera.png',
                                          height: 80,
                                          width: 80,
                                        ),
                                        const Text('Camera'),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  selectImageFromGallery() async {
    XFile? file = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 10);
    if (file != null) {
      return file.path;
    } else {
      return '';
    }
  }

  //
  selectImageFromCamera() async {
    XFile? file = await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 10);
    if (file != null) {
      return file.path;
    } else {
      return '';
    }
  }
}