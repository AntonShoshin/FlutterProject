import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: const FirstHome(),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(builder: (context) => const FirstHome());
          case SecondHome.routeName:
            User user = settings.arguments as User;
            return MaterialPageRoute(
                builder: (context) => SecondHome(user: user));
        }
      },
    ),
  );
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
            Navigator.pushNamed(context, SecondHome.routeName,
                arguments: User('Anton', 35));
          },
          child: const Text('Second Home'),
        ),
      ),
    );
  }
}

class SecondHome extends StatelessWidget {
  final User user;
  static const routeName = '/second';

  const SecondHome({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
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

class User {
  final String name;
  final int age;

  User(this.name, this.age);
}
