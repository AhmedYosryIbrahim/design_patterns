import 'package:factory_design_patterne/prototype_pattern.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Design Patterns Examples'),
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
  final Person person1 = Person(
    name: 'ahmed',
    age: '25',
    nation: 'egypt',
  );
  @override
  Widget build(BuildContext context) {
    final Person person2 = person1.copyWith(name: 'yosry');
    final Person person3 = person1.clone();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'platform buttons',
            ),
            const SizedBox(
              height: 20,
            ),
            Text(person1.name),
            Text(person2.name),
            Text(person3.name),
          ],
        ),
      ),
    );
  }
}
