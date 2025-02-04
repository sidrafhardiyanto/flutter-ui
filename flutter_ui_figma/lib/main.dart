import 'package:flutter/material.dart';
import 'home/pages/home_page.dart';
import 'detail/pages/detail_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(), // Halaman awal yang ditampilkan
      routes: {
        '/detail': (context) => DetailPage(), // Rute untuk DetailPage
      },
    );
  }
}
