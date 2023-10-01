import 'package:asset/theme/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/material/input_decorator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: CustomTheme.lightTheme,
      home: Scaffold(
        appBar: AppBar(
         // titleTextStyle: TextStyle(color: Theme.of(context).primaryColor),
          title: Text('Weather Forecast'),
          centerTitle: true,
          elevation: 0,
        ),
        body: const BodyWF(),
      ),
    );
  }
}

class BodyWF extends StatelessWidget {
  const BodyWF({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Search(),
          Text(
            'data',
            style: TextStyle(color: Theme.of(context).primaryColor),
          )
        ],
      ),
    );
  }
}

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Enter City Name',
        icon: Icon(
          Icons.search_rounded,
          color: Theme.of(context).colorScheme.background,
        ),
      ),
    );
  }
}
