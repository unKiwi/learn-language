import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_language/components/show_btn.dart';
import 'package:learn_language/settings.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Learn language',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Learn language"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              showSetings(context);
            },
            icon: Icon(Icons.settings),
          ),
        ],
      ),
      body: Center(
        child: Row(
          children: [
            Expanded(child: ShowBtn(),),
            Expanded(
              child: Center(
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('Hear'),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          
        },
        child: Icon(Icons.skip_next),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}