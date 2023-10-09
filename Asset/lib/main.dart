import 'dart:math';

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
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        titleTextStyle: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 20,
            fontWeight: FontWeight.bold),
        title: const Text('Weather Forecast'),
        centerTitle: true,
        elevation: 0,
      ),
      body: const BodyWF(),
    );
  }
}

class BodyWF extends StatelessWidget {
  const BodyWF({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Search(),
          CityDetails(),
          TemperatureDetail(),
          ExtraWeatherDetail(),
          Expanded(child: BottomDetail()),
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
        hintStyle: TextStyle(color: Theme.of(context).primaryColor),
        icon: Icon(
          Icons.search_rounded,
          color: Theme.of(context).primaryColor,
        ),
        border: InputBorder.none,
      ),
    );
  }
}

class CityDetails extends StatelessWidget {
  const CityDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Murmansk Oblast, RU',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 30,
          ),
        ),
        Text(
          'Friday, Mar 20, 2020',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 18,
          ),
        )
      ],
    );
  }
}

class TemperatureDetail extends StatelessWidget {
  const TemperatureDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.sunny,
            color: Theme.of(context).primaryColor,
            size: 70,
          ),
          const SizedBox(width: 10),
          Column(
            children: [
              Text(
                '14 °F',
                style: TextStyle(
                    color: Theme.of(context).primaryColor, fontSize: 50),
              ),
              const SizedBox(height: 5),
              Text(
                'LIGHT SNOW',
                style: TextStyle(color: Theme.of(context).primaryColor),
              )
            ],
          )
        ],
      ),
    );
  }
}

class ExtraWeatherDetail extends StatelessWidget {
  const ExtraWeatherDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        WeatherDetailItem(
          text1: '5',
          text2: 'km/hr',
        ),
        WeatherDetailItem(
          text1: '3',
          text2: '%',
        ),
        WeatherDetailItem(
          text1: '20',
          text2: '%',
        ),
      ],
    );
  }
}

class WeatherDetailItem extends StatelessWidget {
  final String text1;
  final String text2;

  const WeatherDetailItem({super.key, required this.text1, required this.text2});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          Icons.ac_unit,
          color: Theme.of(context).primaryColor,
          size: 30,
        ),
        Text(
          text1,
          style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 20),
        ),
        Text(
          text2,
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
      ],
    );
  }
}

class BottomDetail extends StatelessWidget {
  const BottomDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      itemExtent: 170,
      children: const [
        BottomDetailItem(
          day: 'Monday',
          degree: '6',
        ),
        BottomDetailItem(
          day: 'Tuesday',
          degree: '6',
        ),
        BottomDetailItem(
          day: 'Wednesday',
          degree: '6',
        ),
        BottomDetailItem(
          day: 'Thursday',
          degree: '6',
        ),
        BottomDetailItem(
          day: 'Friday',
          degree: '6',
        ),
        BottomDetailItem(
          day: 'Saturday',
          degree: '6',
        ),
        BottomDetailItem(
          day: 'Sunday',
          degree: '6',
        ),
      ],
    );
  }
}

class BottomDetailItem extends StatelessWidget {
  final String day;
  final String degree;

  const BottomDetailItem({super.key, required this.day, required this.degree});

  @override
  Widget build(BuildContext context) {
    return 
      ListTile(
      title: Text(
        day,
        style: const TextStyle(fontSize: 20),
      ),
      subtitle: Row(
        children: [
          Text(
            '$degree °F',
            style: const TextStyle(fontSize: 20),
          ),
          Icon(
            Icons.sunny,
            color: Theme.of(context).primaryColor,
          ),
        ],
      ),
      textColor: Theme.of(context).primaryColor,
    );
  }
}

// class BottomDetail extends StatelessWidget {
//   const BottomDetail({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     List<String> days = <String>[
//       "Monday",
//       "Tuesday",
//       "Wednesday",
//       "Thursday",
//       "Friday",
//       "Saturday",
//       "Sunday"
//     ];
//
//     return SizedBox(
//       height: 80,
//       child: ListView.separated(
//           scrollDirection: Axis.horizontal,
//           itemBuilder: (BuildContext context, int index) {
//             return BottomDetailItem(day: days[index], degree: '6');
//           },
//           separatorBuilder: (BuildContext context, int index) =>
//               const SizedBox(width: 10),
//           itemCount: days.length),
//     );
//   }
// }
//
// class BottomDetailItem extends StatelessWidget {
//    final String day;
//    final String degree;
//   const BottomDetailItem({super.key, required this.day, required this.degree});
//
//   @override
//   Widget build(BuildContext context) {
//     var rng = Random();
//
//     return SizedBox(
//       width: 150,
//       child: ListTile(
//         title: Text(
//           day,
//           style: const TextStyle(fontSize: 20),
//         ),
//         subtitle: Row(
//           children: [
//             Text(
//               '${rng.nextInt(10)+10} °F',
//               style: const TextStyle(fontSize: 20),
//             ),
//             Icon(
//               Icons.sunny,
//               color: Theme.of(context).primaryColor,
//             ),
//           ],
//         ),
//         textColor: Theme.of(context).primaryColor,
//       ),
//     );
//   }
// }
