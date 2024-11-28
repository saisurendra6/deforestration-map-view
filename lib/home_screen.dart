import 'package:flutter/material.dart';
import 'package:map_data/area_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _countController = TextEditingController(text: '300');

  @override
  void dispose() {
    super.dispose();
    _countController.dispose();
  }

  final locations = [
    'Prakasam',
    'YSR Kadapa',
    'Kurnool',
    'Guntur',
    'Nandyal',
  ];

  String currLocation = 'Prakasam';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Spacer(flex: 1),
            const Text("Deforestration Data", style: TextStyle(fontSize: 32)),
            const Spacer(flex: 1),
            TextField(
              controller: _countController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                label: const Text("count"),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 16),
            DropdownButton(
                value: currLocation,
                items: locations
                    .map((item) =>
                        DropdownMenuItem(value: item, child: Text(item)))
                    .toList(),
                onChanged: (val) {
                  setState(() {
                    currLocation = val!;
                  });
                }),
            const SizedBox(height: 32),
            OutlinedButton(
                onPressed: () async {
                  showDialog(
                    context: context,
                    builder: (context) => const AlertDialog(
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CircularProgressIndicator(),
                          SizedBox(height: 16),
                          Text("Loading Data..."),
                        ],
                      ),
                    ),
                  );

                  await Future.delayed(const Duration(seconds: 1));
                  Navigator.of(context).pop();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              AreaScreen(locataion: currLocation)));
                },
                child: const Text("submit")),
            const Spacer(flex: 2),
          ],
        ),
      )),
    );
  }
}
