/// Shipping address
///
class Address {
  late String contactName;
  late String addressLine1;
  late String addressLine2;
  late String city;
  late String region;
  late String country;
  late String postalCode;
}

/// Shippers you can choose from
///
enum ShippingOptions { ups, fedex, purulator, amazon }

/// Order entity
///
class Order {
  late ShippingOptions _shippingMethod;
  late Address _destination;
  late Address _origin;

  Order(ShippingOptions shippingMethod, Address destination, Address origin) {
    _shippingMethod = shippingMethod;
    _destination = destination;
    _origin = origin;
  }

  ShippingOptions get shippingMethod {
    return _shippingMethod;
  }

  Address get origin {
    return _origin;
  }

  Address get destination {
    return _destination;
  }

  void setShippingMethod(ShippingOptions shippingOptions) {
    _shippingMethod = shippingOptions;
  }
}

/// Shipping cost calculation service
///
class ShippingCostCalculatorService {
  double calculateShippingCost(Order order) {
    switch (order.shippingMethod) {
      case ShippingOptions.fedex:
        return calculateForFedEx(order);

      case ShippingOptions.ups:
        return calculateForUPS(order);

      case ShippingOptions.purulator:
        return calculateForPurulator(order);

      default:
        throw Exception("Unknown carrier");
    }
  }

  ///////////////////////////////////////////////////////////////
  /// Terrible coding practice
  ///
  /// Should be handled through a strategy pattern
  double calculateForPurulator(Order order) {
    return 5.00;
  }

  double calculateForUPS(Order order) {
    return 7.25;
  }

  double calculateForFedEx(Order order) {
    return 9.25;
  }
}

///refactor the code to strategy pattern
///
///
abstract class ShipingCostCalculator {
  double calculateShipingCost();
}

class PurulatorCalculator extends ShipingCostCalculator {
  @override
  double calculateShipingCost() {
    return 5.00;
  }
}

class UpsCalculator extends ShipingCostCalculator {
  @override
  double calculateShipingCost() {
    return 7.25;
  }
}

class FedexCalculator extends ShipingCostCalculator {
  @override
  double calculateShipingCost() {
    return 9.25;
  }
}

class AmazonCalculator extends ShipingCostCalculator {
  @override
  double calculateShipingCost() {
    return 3.25;
  }
}
