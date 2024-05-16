import 'package:flutter/material.dart';
import 'package:librarymanagment/Pages/dark%20mode/theme_provider.dart';
import 'package:librarymanagment/Pages/page/add.dart';
import 'package:librarymanagment/Pages/page/information/information.dart';
import 'package:librarymanagment/Pages/page/home.dart';
import 'package:provider/provider.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeProvider(),
    child:const myapp()));
}

// ignore: camel_case_types
class myapp extends StatefulWidget {
  const myapp({super.key});

  @override
  State<myapp> createState() => _myappState();
}

// ignore: camel_case_types
class _myappState extends State<myapp> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: Provider.of<ThemeProvider>(context).themeData,
      debugShowCheckedModeBanner: false,
      initialRoute: 'home',
      routes: {
        'home':(context) => const home(),
        'add':(context) => const add(),
        'inf':(context) => const information(),
      },
  );
  }
}