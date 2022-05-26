import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Container(width: 30, height: 30, color: Colors.red);
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

  void _incrementCounter() {
    setState(() {
      _counter++;
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
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(
                    width: 250,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      // Form Field aqui para agrupar os text e gerar novos com o botão (adicionar list view para o scroll)
                      child: TextField(
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Meta',
                        ),
                      ),
                    ),
                  ),
                  Container(width: 30, height: 30, color: Colors.red),
                ]),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
              child: FloatingActionButton(
                onPressed: _incrementCounter,
                tooltip: 'Adicionar linha',
                child: const Icon(Icons.add),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
