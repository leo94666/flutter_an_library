import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_an_library/welcome/Welcome.dart';

class MainHome extends StatelessWidget {
  const MainHome({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainHomePage(
        title: 'Flutter AnLibrary',
      ),
    );
  }
}

class MainHomePage extends StatefulWidget {
  const MainHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  get _appbar => AppBar(
        title: Text(widget.title),
      );

  get _drawer => const Drawer(
        child: Text('This is Drawer'),
      );

  get _drawer2 => Drawer(
        child: Column(
          children: <Widget>[
            Row(
              children: const [
                Expanded(
                  child: UserAccountsDrawerHeader(
                    accountName: Text("Leo"),
                    accountEmail: Text("liyang.ok@outlook.com"),
                    currentAccountPicture: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/leo.png'),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            Text('Hello World $_counter'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      drawer: _drawer2,
    );
  }
}
