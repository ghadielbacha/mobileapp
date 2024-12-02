import 'package:flutter/material.dart';

class TrackingPage extends StatefulWidget {
  const TrackingPage({Key? key}) : super(key: key);

  @override
  _TrackingPageState createState() => _TrackingPageState();
}

class _TrackingPageState extends State<TrackingPage> {
  String? _goal = 'None'; // Default value
  final TextEditingController _controllerExpectedWeight = TextEditingController();

  @override
  void dispose() {
    _controllerExpectedWeight.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final name = args['name'];
    final height = args['height'];
    final weight = args['weight'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tracking Details'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Text(
              'Name: $name',
              style: const TextStyle(
                color: Colors.blue,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Height: ${height.toStringAsFixed(2)} m',
              style: const TextStyle(
                color: Colors.blue,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Weight: ${weight.toStringAsFixed(2)} kg',
              style: const TextStyle(
                color: Colors.blue,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),

            // Goal selection
            const Text(
              'Choose your goal:',
              style: TextStyle(fontSize: 18),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio<String>(
                  value: 'Lose Weight',
                  groupValue: _goal,
                  onChanged: (value) {
                    setState(() {
                      _goal = value!;
                    });
                  },
                ),
                const Text('Lose Weight'),
                Radio<String>(
                  value: 'Gain Weight',
                  groupValue: _goal,
                  onChanged: (value) {
                    setState(() {
                      _goal = value!;
                    });
                  },
                ),
                const Text('Gain Weight'),
              ],
            ),
            const SizedBox(height: 10),

            // Expected weight input field
            SizedBox(
              width: 200,
              height: 50,
              child: TextField(
                controller: _controllerExpectedWeight,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your expected weight (kg)',
                ),
              ),
            ),
            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                // Handle submission of goal and expected weight
                String expectedWeight = _controllerExpectedWeight.text;
                if (_goal == 'None' || expectedWeight.isEmpty) {
                  print('Please choose a goal and enter expected weight.');
                } else {
                  print('Goal: $_goal, Expected Weight: $expectedWeight kg');
                }
              },
              child: const Icon(Icons.check, size: 50),
            ),
            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Icon(Icons.navigate_before, size: 50),
            ),
          ],
        ),
      ),
    );
  }
}

