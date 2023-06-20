class Person {
  final String name;
  final String age;
  final String nation;

  Person({
    required this.name,
    required this.age,
    required this.nation,
  });

  // prototype pattern to take a copy of instance and want to change it attribute if it imutable class
  Person copyWith({
    String? name,
    String? age,
    String? nation,
  }) {
    return Person(
      name: name ?? this.name,
      age: age ?? this.age,
      nation: nation ?? this.nation,
    );
  }

  Person clone() => copyWith();
}
