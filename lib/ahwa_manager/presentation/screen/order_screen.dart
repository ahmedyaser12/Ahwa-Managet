
import 'package:ahwa_manger/ahwa_manager/data/repo/orders_repo.dart';
import 'package:flutter/material.dart';

class OrdersScreen extends StatefulWidget {
  final OrderManager orderManager;

  OrdersScreen({required this.orderManager});

  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  @override
  Widget build(BuildContext context) {
    final pendingOrders = widget.orderManager.getPendingOrders();

    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Pending Orders', style: Theme.of(context).textTheme.headlineSmall),
          SizedBox(height: 16),
          Expanded(
            child: pendingOrders.isEmpty
                ? Center(child: Text('No pending orders'))
                : ListView.builder(
                    itemCount: pendingOrders.length,
                    itemBuilder: (context, index) {
                      final order = pendingOrders[index];
                      return Card(
                        margin: EdgeInsets.only(bottom: 8),
                        child: ListTile(
                          title: Text('${order.customerName} - ${order.drink.name}'),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (order.specialInstructions.isNotEmpty)
                                Text('Special: ${order.specialInstructions}'),
                              Text('Price: ${order.drink.basePrice} LE'),
                            ],
                          ),
                          trailing: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                order.markAsCompleted();
                              });
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Order #${order.id} completed!')),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              foregroundColor: Colors.white,
                            ),
                            child: Text('Complete'),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

