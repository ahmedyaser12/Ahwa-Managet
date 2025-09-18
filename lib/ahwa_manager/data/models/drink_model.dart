// SOLID Principle 1: Single Responsibility Principle (SRP)
// Each class has a single, well-defined responsibility
// Abstract base class demonstrating OOP Abstraction
abstract class DrinkItem {
  String get name;
  double get basePrice;
}

// Concrete implementations demonstrating Inheritance and Polymorphism
class DrinkModel extends DrinkItem {
  final String _name;
  final double _basePrice;

  DrinkModel(this._name, this._basePrice);

  @override
  String get name => _name;

  @override
  double get basePrice => _basePrice;
}
