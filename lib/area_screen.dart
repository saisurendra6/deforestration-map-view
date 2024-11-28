import 'package:flutter/material.dart';
import 'package:map_data/map_screen.dart';

class AreaScreen extends StatelessWidget {
  final String locataion;
  const AreaScreen({super.key, required this.locataion});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(locataion),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("Deforestation Area(ha): 0.6895755493164063",
                  style: TextStyle(fontSize: 24)),
              const SizedBox(height: 40),
              FilledButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MapScreen(locataion: locataion))),
                child: const Text("See on Map"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
