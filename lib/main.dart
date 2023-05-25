import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  // final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final List<int> _list = [];

  void _incrementCounter() {
    setState(() {
      _counter++;
      _list.add(_counter);
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
      _list.clear();
    });
  }

  _isPremier(int item) {
    if (item == 1) {
      return false;
    }
    for (int i = 2; i < item; i++) {
      if (item % i == 0) {
        return false;
      }
    }
    return true;
  }

  _getImage(int item) {
    if (_isPremier(item)) {
      return Image.asset('assets/images/ananas.png');
    } else if (item % 2 == 0) {
      return Image.asset('assets/images/pomme.png');
    } else {
      return Image.asset('assets/images/poire.png');
    }
  }

  _getTitle(int item) {
    if (_isPremier(item)) {
      return 'Premier';
    } else if (item % 2 == 0) {
      return 'Pair';
    } else {
      return 'Impair';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Center(
            child: Text(
              '$_counter : Nombre ${_getTitle(_counter)}',
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
        body: Center(
          child: ListView(
            children: <Widget>[
              for (final int item in _list)
                Container(
                  height: 50,
                  color: item % 2 == 0 ? Colors.cyan : Colors.indigo,
                  child: Row(
                    children: [
                      _getImage(item),
                      Text(
                        '$item',
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: _incrementCounter,
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
            FloatingActionButton(
              onPressed: _resetCounter,
              tooltip: 'Reset',
              child: const Icon(Icons.refresh),
            )
          ],
        ));
  }
}
