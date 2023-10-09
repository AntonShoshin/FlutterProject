import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: const FirstHome(),
    routes: {
      FirstHome.routeName: (context) => FirstHome(),
      SecondHome.routeName: (context) => SecondHome(),
    },
  ));
}

class FirstHome extends StatelessWidget {
  const FirstHome({super.key});
  static const routeName = '/first';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text('First Home'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, SecondHome.routeName, arguments: User('Anton', 34));
          },
          child: const Text('Second Home'),
        ),
      ),
    );
  }
}

class SecondHome extends StatelessWidget {
  late User user;
  static const routeName = '/second';

  SecondHome({super.key});
  @override
  Widget build(BuildContext context) {
    RouteSettings settings = ModalRoute.of(context)!.settings;
    user = settings.arguments as User;

    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text('${user.name} - ${user.age}'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('First Home'),
        ),
      ),
    );
  }
}

class User{
  final String name;
  final int age;

  User(this.name, this.age);
}