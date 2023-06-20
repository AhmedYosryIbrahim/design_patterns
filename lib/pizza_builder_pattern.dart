enum PizzaSize {
  small,
  medium,
  large,
}

enum PizzaSauce { none, tomato, mild, hot }

class Pizza {
  late final String _name;
  late final double _price;
  late final PizzaSize _size;
  late final PizzaSauce _sauce;

  ///getters
  String get name => _name;
  double get price => _price;
  PizzaSize get size => _size;
  PizzaSauce get sauce => _sauce;

  /// setters
  void setName(String name) {
    _name = name;
  }

  void setPrice(double price) {
    _price = price;
  }

  void setSize(PizzaSize size) {
    _size = size;
  }

  void setSauce(PizzaSauce sauce) {
    _sauce = sauce;
  }
}

abstract class PizzaBuilder {
  late String name;

  late Pizza pizza;

  void createPizza() {
    pizza = Pizza();
    pizza.setName(name);
  }

  Pizza getPizza() {
    return pizza;
  }

  void buildSauce();

  void buildSize();
}

class SmallTomatoPizzaBuilder extends PizzaBuilder {
  static const String pizzaName = 'small tomato pizza';

  SmallTomatoPizzaBuilder() {
    super.name = pizzaName;
  }

  @override
  void buildSauce() {
    super.pizza.setSauce(PizzaSauce.tomato);
  }

  @override
  void buildSize() {
    super.pizza.setSize(PizzaSize.small);
  }
}

class LargeHotPizzaBuilder extends PizzaBuilder {
  static const String pizzaName = 'Large hot pizza';

  LargeHotPizzaBuilder() {
    super.name = pizzaName;
  }

  @override
  void buildSauce() {
    pizza.setSauce(PizzaSauce.hot);
  }

  @override
  void buildSize() {
    pizza.setSize(PizzaSize.large);
  }
}

class PizzaDirectory {
  late PizzaBuilder _pizzaBuilder;

  void setPizzaBuilder(PizzaBuilder builder) {
    _pizzaBuilder = builder;
  }

  Pizza getPizza() {
    return _pizzaBuilder.pizza;
  }

  void createPizza() {
    _pizzaBuilder.createPizza();
    _pizzaBuilder.buildSauce();
    _pizzaBuilder.buildSize();
  }
}
