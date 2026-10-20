import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Corner Radius Configurator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _topLeft = 0.0;
  double _topRight = 0.0;
  double _bottomLeft = 0.0;
  double _bottomRight = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(_topLeft),
                  topRight: Radius.circular(_topRight),
                  bottomLeft: Radius.circular(_bottomLeft),
                  bottomRight: Radius.circular(_bottomRight),
                ),
              ),
            ),
            const SizedBox(height: 50),

            Row(
              children: [
                Expanded(
                  child: _buildSliderControl(
                    label: 'TL',
                    value: _topLeft,
                    onChanged: (val) => setState(() => _topLeft = val),
                  ),
                ),
                Expanded(
                  child: _buildSliderControl(
                    label: 'TR',
                    value: _topRight,
                    onChanged: (val) => setState(() => _topRight = val),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            Row(
              children: [
                Expanded(
                  child: _buildSliderControl(
                    label: 'BL',
                    value: _bottomLeft,
                    onChanged: (val) => setState(() => _bottomLeft = val),
                  ),
                ),
                Expanded(
                  child: _buildSliderControl(
                    label: 'BR',
                    value: _bottomRight,
                    onChanged: (val) => setState(() => _bottomRight = val),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSliderControl({
    required String label,
    required double value,
    required ValueChanged<double> onChanged,
  }) {
    return Column(
      children: [
        Text(
          '$label: ${value.toStringAsFixed(2)}',
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        Slider(
          value: value,
          min: 0.0,
          max: 75.0,
          onChanged: onChanged,
        ),
      ],
    );
  }
}