class SecondSingletonImpl {
  static SecondSingletonImpl? _instance;

  SecondSingletonImpl._internal() {
    print('privet constructor call');
  }

  static SecondSingletonImpl get instance {
    _instance ??= SecondSingletonImpl._internal();
    return _instance!;
  }
}
