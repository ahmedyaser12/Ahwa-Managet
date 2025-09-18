import 'package:ahwa_manger/ahwa_manager/data/models/drink_model.dart';

class Order {
  static int _nextId = 1;
  final int id;
  final String customerName;
  final DrinkItem drink;
  final String specialInstructions;
  final DateTime orderTime;
  bool isCompleted;

  Order({
    required this.customerName,
    required this.drink,
    this.specialInstructions = '',
  })  : id = _nextId++,
        orderTime = DateTime.now(),
        isCompleted = false;
// Encapsulation - controlled access to order completion
  void markAsCompleted() {
    isCompleted = true;
  }
}
