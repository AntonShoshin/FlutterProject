import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Weather',
            style: TextStyle(color: Colors.black87),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: const IconButton(
            icon: Icon(Icons.menu),
            onPressed: null,
          ),
          actions: const [
            IconButton(
              onPressed: null,
              icon: Icon(Icons.settings),
            )
          ],
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
        body: const BuildBody(),
      ),
    );
  }
}

class BuildBody extends StatelessWidget {
  const BuildBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          HeaderImage(),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(children: [
                WeatherDescription(),
                Divider(),
                Temperature(),
                Divider(),
                TemperatureForecast(),
                Divider(),
                FooterRatings(),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}

class HeaderImage extends StatelessWidget {
  const HeaderImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Image(
      image: NetworkImage(
          'https://static.report.az/photo/5eaac944-cf02-3a40-867b-22dd975ed8cc_850.jpg'),
      fit: BoxFit.cover,
    );
  }
}

class WeatherDescription extends StatelessWidget {
  const WeatherDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          'Thursday - May 22',
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
        Divider(),
        Text(
          'Переменная облачность, возможно выпадение небольших осадков. В целом всё прекрасно!',
          style: TextStyle(color: Colors.black54),
        )
      ],
    );
  }
}

class Temperature extends StatelessWidget {
  const Temperature({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Icon(
              Icons.wb_sunny,
              color: Colors.yellow,
            ),
          ],
        ),
        SizedBox(
          width: 16,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  '15 Clear',
                  style: TextStyle(
                    color: Colors.deepPurple,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'Samarskaja obl., Samara',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                )
              ],
            )
          ],
        )
      ],
    );
  }
}

class TemperatureForecast extends StatelessWidget {
  const TemperatureForecast({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      children: List.generate(8, (int index) {
        return Chip(
          avatar: Icon(
            Icons.wb_cloudy,
            color: Colors.blue.shade300,
          ),
          label: Text(
            '${index + 20}°C',
            style: const TextStyle(fontSize: 15),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(color: Colors.grey),
          ),
          backgroundColor: Colors.grey.shade100,
        );
      }),
    );
  }
}

class FooterRatings extends StatelessWidget {
  const FooterRatings({super.key});

  @override
  Widget build(BuildContext context) {
    var stars = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.star,
          size: 15,
          color: Colors.yellow[600],
        ),
        Icon(
          Icons.star,
          size: 15,
          color: Colors.yellow[600],
        ),
        Icon(
          Icons.star,
          size: 15,
          color: Colors.yellow[600],
        ),
        Icon(
          Icons.star_border,
          size: 15,
          color: Colors.yellow[600],
        ),
        Icon(
          Icons.star_border,
          size: 15,
          color: Colors.yellow[600],
        ),
      ],
    );
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Text(
          'Info with openweathermap.org',
          style: TextStyle(fontSize: 15),
        ),
        stars,
      ],
    );
  }
}
