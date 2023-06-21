import 'package:factory_design_patterne/shipping.dart';
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
  ShipingCostCalculator? shipingCostCalculator;
  ShippingOptions? shippingOptions;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          const Text(
            'Strategy pattern',
          ),
          const SizedBox(
            height: 20,
          ),
          RadioListTile(
            title: const Text('purulator calculator'),
            value: ShippingOptions.purulator,
            groupValue: shippingOptions,
            onChanged: (value) {
              setState(() {
                shippingOptions = value;
                shipingCostCalculator = PurulatorCalculator();
              });
            },
          ),
          RadioListTile(
            title: const Text('ups calculator'),
            value: ShippingOptions.ups,
            groupValue: shippingOptions,
            onChanged: (value) {
              setState(() {
                shippingOptions = value;
                shipingCostCalculator = UpsCalculator();
              });
            },
          ),
          RadioListTile(
            title: const Text('fedex calculator'),
            value: ShippingOptions.fedex,
            groupValue: shippingOptions,
            onChanged: (value) {
              setState(() {
                shippingOptions = value;
                shipingCostCalculator = FedexCalculator();
              });
            },
          ),
          RadioListTile(
            title: const Text('amazon calculator'),
            value: ShippingOptions.amazon,
            groupValue: shippingOptions,
            onChanged: (value) {
              setState(() {
                shippingOptions = value;
                shipingCostCalculator = AmazonCalculator();
              });
            },
          ),
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            child:
                Text('${shipingCostCalculator?.calculateShipingCost() ?? 0.0}'),
          )
        ],
      ),
    );
  }
}
