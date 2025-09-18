// SOLID Principle 2: Open/Closed Principle (OCP)
// Order class is open for extension but closed for modification
// SOLID Principle 3: Interface Segregation Principle (ISP)
// Separate interfaces for different responsibilities
import 'package:ahwa_manger/ahwa_manager/data/models/order_model.dart';

abstract class OrderRepository {
  void addOrder(Order order);
  List<Order> getAllOrders();
  List<Order> getPendingOrders();
  List<Order> getCompletedOrders();
}

abstract class ReportGenerator {
  Map<String, int> getTopSellingDrinks();
  int getTotalOrdersServed();
  double getTotalRevenue();
}

class OrderManager implements OrderRepository, ReportGenerator {
  List<Order> _orders = [];
  @override
  void addOrder(Order order) {
    _orders.add(order);
  }

  @override
  List<Order> getAllOrders() {
    return _orders;
  }

  @override
  Map<String, int> getTopSellingDrinks() {
    Map<String, int> drinkCounts = {};
    for (Order order in getAllOrders()) {
      drinkCounts[order.drink.name] = (drinkCounts[order.drink.name] ?? 0) + 1;
    }
    return Map.fromEntries(
      drinkCounts.entries.toList()..sort((a, b) => b.value.compareTo(a.value)),
    );
  }

  @override
  int getTotalOrdersServed() {
    return getAllOrders().length;
  }

  @override
  double getTotalRevenue() {
    return getAllOrders()
        .map((order) => order.drink.basePrice)
        .fold(0.0, (sum, price) => sum + price);
  }

  @override
  List<Order> getCompletedOrders() {
    return getAllOrders().where((order) => order.isCompleted).toList();
  }

  @override
  List<Order> getPendingOrders() {
    return getAllOrders().where((order) => !order.isCompleted).toList();
  }
}
