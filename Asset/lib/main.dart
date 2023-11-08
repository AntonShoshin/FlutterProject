import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Networking',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text('Networking'),
        centerTitle: true,
      ),
      body: Center(
        child: null,
      ),
    );
  }
}

Future<http.Response> getData() async {

  Uri url = Uri.https('about.google', 'static/data/locations.json');
  return await http.get(url);

}

void loadData() {
  getData().then(
    (response) {
      if (response.statusCode == 200) {
        print(response.body);
      } else {
        print(response.statusCode);
      }
    },
  ).catchError((error) {
    debugPrint(error.toString());
  });
}
