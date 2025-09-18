import 'package:flutter/material.dart';

import '../../data/local_data/local_data.dart';
import '../../data/models/drink_model.dart';
import '../../data/models/order_model.dart';
import '../../data/repo/orders_repo.dart';

class NewOrderScreen extends StatefulWidget {
  final OrderManager orderManager;
  final DrinkMenu drinkMenu;

  NewOrderScreen({required this.orderManager, required this.drinkMenu});

  @override
  _NewOrderScreenState createState() => _NewOrderScreenState();
}

class _NewOrderScreenState extends State<NewOrderScreen> {
  final _customerNameController = TextEditingController();
  final _specialInstructionsController = TextEditingController();
  DrinkItem? _selectedDrink;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Add New Order', style: Theme.of(context).textTheme.headlineSmall),
          SizedBox(height: 20),
          TextField(
            controller: _customerNameController,
            decoration: InputDecoration(
              labelText: 'Customer Name',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 16),
          DropdownButtonFormField<DrinkItem>(
            value: _selectedDrink,
            decoration: InputDecoration(
              labelText: 'Select Drink',
              border: OutlineInputBorder(),
            ),
            items: widget.drinkMenu.drinks.map((drink) {
              return DropdownMenuItem(
                value: drink,
                child: Text('${drink.name} - ${drink.basePrice} LE'),
              );
            }).toList(),
            onChanged: (DrinkItem? drink) {
              setState(() => _selectedDrink = drink);
            },
          ),
          SizedBox(height: 16),
          TextField(
            controller: _specialInstructionsController,
            decoration: InputDecoration(
              labelText: 'Special Instructions (e.g., "extra mint, ya rais")',
              border: OutlineInputBorder(),
            ),
            maxLines: 2,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _addOrder,
            child: Text('Add Order'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.brown[700],
              foregroundColor: Colors.white,
              minimumSize: Size(double.infinity, 50),
            ),
          ),
        ],
      ),
    );
  }

  void _addOrder() {
    if (_customerNameController.text.isEmpty || _selectedDrink == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill in customer name and select a drink')),
      );
      return;
    }

    final order = Order(
      customerName: _customerNameController.text,
      drink: _selectedDrink!,
      specialInstructions: _specialInstructionsController.text,
    );

    widget.orderManager.addOrder(order);

    _customerNameController.clear();
    _specialInstructionsController.clear();
    setState(() => _selectedDrink = null);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Order added successfully!')),
    );
  }
}
