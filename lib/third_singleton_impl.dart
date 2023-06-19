class ThirdSingletonImpl {
  static ThirdSingletonImpl? _instance;

  ThirdSingletonImpl._internal() {
    print('privet constructor call');
  }

  factory ThirdSingletonImpl() {
    _instance ??= ThirdSingletonImpl._internal();
    return _instance!;
  }
}
