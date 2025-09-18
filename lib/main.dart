import 'package:ahwa_manger/ahwa_manager/data/local_data/local_data.dart';
import 'package:ahwa_manger/ahwa_manager/data/repo/orders_repo.dart';
import 'package:ahwa_manger/ahwa_manager/presentation/screen/add_order_screen.dart';
import 'package:ahwa_manger/ahwa_manager/presentation/screen/order_screen.dart';
import 'package:ahwa_manger/ahwa_manager/presentation/screen/reports_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(SmartAhwaManagerApp());
}

class SmartAhwaManagerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Ahwa Manager',
      theme: ThemeData(
        primarySwatch: Colors.brown,
        fontFamily: 'Arial',
      ),
      home: AhwaManagerScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}


class AhwaManagerScreen extends StatefulWidget {
  @override
  _AhwaManagerScreenState createState() => _AhwaManagerScreenState();
}

class _AhwaManagerScreenState extends State<AhwaManagerScreen> {
  final OrderManager _orderManager = OrderManager();
  final DrinkMenu _drinkMenu = DrinkMenu();
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Smart Ahwa Manager'),
        backgroundColor: Colors.brown[700],
        foregroundColor: Colors.white,
      ),
      body: _getSelectedScreen(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.brown[700],
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'New Order'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Orders'),
          BottomNavigationBarItem(icon: Icon(Icons.analytics), label: 'Reports'),
        ],
      ),
    );
  }

  Widget _getSelectedScreen() {
    switch (_selectedIndex) {
      case 0:
        return NewOrderScreen(orderManager: _orderManager, drinkMenu: _drinkMenu);
      case 1:
        return OrdersScreen(orderManager: _orderManager);
      case 2:
        return ReportsScreen(orderManager: _orderManager);
      default:
        return Container();
    }
  }
}

