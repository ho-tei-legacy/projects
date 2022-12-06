import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint("Ran floating button");
        },
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          Center(
            child: Container(
              child: const Text(
                "Placeholder",
                style: TextStyle(
                  fontSize: 32,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
