import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inhereted Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider<CountProvider>.value(value: CountProvider()),
        ],
        child: Consumer<CountProvider>(builder: (context, value, child) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black,
              title: Text('Homework Provider',
                  style: TextStyle(
                      color:
                          Color((Random().nextDouble() * 0xFFFFFF).toInt() << 0)
                              .withOpacity(1.0))),
              centerTitle: true,
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedContainer(
                    height: 150,
                    width: 150,
                    color:
                        Color((Random().nextDouble() * 0xFFFFFF).toInt() << 0)
                            .withOpacity(1.0), duration: const Duration(seconds: 1),
                  ),
                  Switch(
                    value: value.change,
                    onChanged: (_) {
                      value._switch();
                    },
                  )
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}

class CountProvider extends ChangeNotifier {
  bool change = false;

  bool get counterValue => change;

  void _switch() {
    change = !change;
    notifyListeners();
  }
}
