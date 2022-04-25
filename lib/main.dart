import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contador de pessoas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Contador de pessoas na sala'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String _msg = "";
  final int _maxcap = 7;

  void _incrementCounter() {
    setState(() {
      _counter++;
      if (_counter >= _maxcap) {
        _msg = "Sala lotada!";
        _counter = _maxcap;
      }
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
      if (_counter < _maxcap && _counter >= 1) _msg = "";
      if (_counter < 0) _counter = 0;
      if (_counter == 0) _msg = "Sala vazia!";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              "imagens/sala.jpg",
              height: 200,
            ),
            const Text(
              'Quantas pessoas estão na sala:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              _msg,
              style: const TextStyle(
                color: Colors.red,
                fontSize: 20,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: _incrementCounter,
                  child: const Text('Incrementar'),
                ),
                const SizedBox(width: 5),
                ElevatedButton(
                  onPressed: _decrementCounter,
                  child: const Text('Decrementar'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
