class FirstSingletonImpl {
  static FirstSingletonImpl? _instance;

  FirstSingletonImpl._internal() {
    print('privet constructor call');
  }

  static FirstSingletonImpl getInstance() {
    _instance ??= FirstSingletonImpl._internal();
    return _instance!;
  }
}
