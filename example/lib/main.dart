import 'package:flutter/material.dart';

import 'package:routils/routils.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();

    ///user like this:
    RoStringUtils.isEmpty('asdasdsad');
    ///or like this:
    roStringIsEmpty('textasdasd');


  }

  @override
  Widget build(BuildContext context) {
    List list = ['asdasd', 'asdasdasd'];
    Map map = {'asd':123};
    Set set = Set();
    Iterable it = Iterable.empty();
    String string = 'sadasd';

    print(roLength(list));
    print(roLength(map));
    print(roLength(set));
    print(roLength(it));
    print(roLength(string));

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text('Running on: $_platformVersion\n'),
        ),
      ),
    );
  }
}
