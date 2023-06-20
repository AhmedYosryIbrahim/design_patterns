import 'package:factory_design_patterne/pizza_builder_pattern.dart';
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
  final PizzaDirectory directory = PizzaDirectory();
  final SmallTomatoPizzaBuilder smallTomatoPizzaBuilder =
      SmallTomatoPizzaBuilder();
  final LargeHotPizzaBuilder largeHotPizzaBuilder = LargeHotPizzaBuilder();
  @override
  Widget build(BuildContext context) {
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
            TextButton(
                onPressed: () {
                  directory.setPizzaBuilder(smallTomatoPizzaBuilder);
                  directory.createPizza();
                  final Pizza pizza = directory.getPizza();
                  print('${pizza.name} , ${pizza.size} , ${pizza.sauce}');
                },
                child: const Text('create small pizza')),
            TextButton(
                onPressed: () {
                  directory.setPizzaBuilder(largeHotPizzaBuilder);
                  directory.createPizza();
                  final Pizza pizza = directory.getPizza();
                  print('${pizza.name} , ${pizza.size} , ${pizza.sauce}');
                },
                child: const Text('create large pizza'))
          ],
        ),
      ),
    );
  }
}
