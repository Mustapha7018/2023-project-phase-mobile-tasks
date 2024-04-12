import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MaterialApp(
    home: Container(
      color: Colors.white,
      child: const SafeArea(
        child: MyHomePage(),
      ),
    ),
  ));
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void incrementCounter() {
    setState(() {
      _counter = (_counter + 1) % 11;
    });
  }

  void decrementCounter() {
    setState(() {
      _counter = (_counter - 1) % 11;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(217, 255, 250, 1),
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 80,
        backgroundColor: const Color.fromRGBO(37, 42, 91, 1),
        title: Text(
          'Circular Counter App',
          style: GoogleFonts.inter(color: Colors.white),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 10,
            child: Center(
              child: Text(
                '$_counter',
                style: GoogleFonts.inter(fontSize: 100),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FilledButton(
                  style: FilledButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: 18, horizontal: 40),
                    backgroundColor: const Color.fromRGBO(253, 11, 11, 1),
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  child: const Text('Decrement'),
                  onPressed: () {
                    decrementCounter();
                  },
                ),
                FilledButton(
                  style: FilledButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: 18, horizontal: 40),
                    backgroundColor: const Color.fromRGBO(68, 183, 28, 1),
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  child: const Text('Increment'),
                  onPressed: () {
                    incrementCounter();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
