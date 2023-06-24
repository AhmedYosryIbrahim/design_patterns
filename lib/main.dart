import 'package:factory_design_patterne/facad_pattern.dart';
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
  final String _movie = 'The Matrix';
  late final HomeTheaterFacade _homeTheaterFacade;
  final Amplifier _amplifier = Amplifier();
  final Tuner _tuner = Tuner();
  final DvdPlayer _dvdPlayer = DvdPlayer();
  final CdPlayer _cdPlayer = CdPlayer();
  final Projector _projector = Projector();
  final TheaterLights _theaterLights = TheaterLights();
  final Screen _screen = Screen();
  final PopcornPopper _popcornPopper = PopcornPopper();

  @override
  void initState() {
    _homeTheaterFacade = HomeTheaterFacade(_amplifier, _tuner, _dvdPlayer,
        _cdPlayer, _projector, _theaterLights, _screen, _popcornPopper);
    super.initState();
  }

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
            ElevatedButton(
                onPressed: () {
                  _homeTheaterFacade.watchMovie(_movie);
                },
                child: const Text('watch movie')),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  _homeTheaterFacade.endMovie();
                },
                child: const Text('end movie')),
          ],
        ),
      ),
    );
  }
}
