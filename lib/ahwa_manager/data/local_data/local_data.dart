
import '../models/drink_model.dart';

class DrinkMenu {
  final List<DrinkItem> _drinks = [
    DrinkModel('Shai (Tea)', 5.0),
    DrinkModel('Turkish Coffee', 8.0),
    DrinkModel('Hibiscus Tea', 6.0),
    DrinkModel('Mint Tea', 5.5),
    DrinkModel('Cappuccino', 15.0),
    DrinkModel('Latte', 18.0),
    DrinkModel('Americano', 12.0),
  ];

  List<DrinkItem> get drinks => List.unmodifiable(_drinks);

  DrinkItem? getDrinkByName(String name) {
    try {
      return _drinks.firstWhere((drink) => drink.name == name);
    } catch (e) {
      return null;
    }
  }
}