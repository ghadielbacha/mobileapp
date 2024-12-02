import 'package:flutter/material.dart';
import 'tracking.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerHeight = TextEditingController();
  final TextEditingController _controllerWeight = TextEditingController();

  @override
  void dispose() {
    _controllerName.dispose();
    _controllerHeight.dispose();
    _controllerWeight.dispose();
    super.dispose();
  }

  void openTrackingPage() {
    try {
      String name = _controllerName.text;
      double height = double.parse(_controllerHeight.text);
      double weight = double.parse(_controllerWeight.text);
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const TrackingPage(),
          settings: RouteSettings(arguments: {
            'name': name,
            'height': height,
            'weight': weight,
          }),
        ),
      );
    } catch (e) {
      print(e); // handle errors better in production
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fitness Tracking App'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 10),
            SizedBox(
              width: 200,
              height: 50,
              child: TextField(
                controller: _controllerName,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your name',
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: 200,
              height: 50,
              child: TextField(
                controller: _controllerHeight,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your height (m)',
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: 200,
              height: 50,
              child: TextField(
                controller: _controllerWeight,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your weight (kg)',
                ),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: openTrackingPage,
              child: const Icon(Icons.navigate_next, size: 50),
            ),
          ],
        ),
      ),
    );
  }
}
